from django.shortcuts import get_object_or_404
from .models import Industry, Questions, UserResponse
from .serializer import QuestionSerializer, IndustrySerializer,UserResponseSerializer
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import viewsets,status
from rest_framework.decorators import action
from business.models import Business,BusinessScore
from rest_framework.exceptions import ValidationError
from rest_framework_simplejwt.tokens import AccessToken
from user_account.models import User
from rest_framework.response import Response
from django.utils import timezone

def calculate_percentage_of_questions_answered(response):
    return len(response['questions_to_score'])
    



class IsSuperUser(permissions.BasePermission):
    """
    Custom permission to only allow superusers to edit,update, or delete.
    """

    def has_permission(self, request, view):
        return request.user and request.user.is_superuser


class IndustryViewSet(viewsets.ModelViewSet):
    queryset = Industry.objects.all()
    serializer_class = IndustrySerializer
    permission_classes = []
    authentication_classes = []

    
class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Questions.objects.all()
    serializer_class = QuestionSerializer
    permission_classes = []
    authentication_classes = []

    def create(self,request,*args,**kwargs):
        data = request.data
        
        
        number_of_questions = calculate_percentage_of_questions_answered(data.get('questions'))
        
        
        if Questions.objects.exists():
            question_instance = Questions.objects.first()
            question_instance.questions = data.get('questions',question_instance.questions)
            question_instance.number_of_questions = number_of_questions
            question_instance.time = timezone.now()
            question_instance.save()
            serializers = self.get_serializer(question_instance)
            return Response(serializers.data)
        else:
            data['number_of_questions'] = number_of_questions
            data['time'] = timezone.now()
            serializer = self.get_serializer(data=data)
            serializer.is_valid(raise_exception=True)
            self.perform_create(serializer)
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
            # print(data)
            # return super().create(request,*args,**kwargs)

class UserResponseViewSet(viewsets.ModelViewSet):
    queryset = UserResponse.objects.all()
    serializer_class = UserResponseSerializer
    permission_classes = []
    authentication_classes = []

    def calculate_total_score(self,response):
        total_score = 0
        for question, answers in response["questions_to_score"].items():
            total_score += float(answers)
        return total_score


    @action(detail=False,methods=['POST'])
    def receive_response(self,request):
        try:
            token = request.headers.get("Authorization").split(" ")[-1]
            decoded_token = AccessToken(token)
            user_id = decoded_token.get("user_id")
            user = User.objects.get(id=user_id)
        except User.DoesNotExist:
            return Response({"message":'User not in system'},status=status.HTTP_404_NOT_FOUND)
        
        
        if not user.is_authenticated:
            return Response({'message':'User must be authenticated'},status=status.HTTP_401_UNAUTHORIZED)
        
        business_id = request.data.get('business')
        if not business_id:
            return Response({'message':"Business ID is required"},status=status.HTTP_400_BAD_REQUEST)
        
        try:
            business = Business.objects.get(id=business_id)
        except Business.DoesNotExist:
            return Response({'message':"Business not found"},status=status.HTTP_400_BAD_REQUEST)
        
        total_question_to_answer = Questions.objects.first().number_of_questions
        
        user_response,created = UserResponse.objects.get_or_create(user=user,business=business)
        user_response.responses = request.data.get('responses',user_response)
        total_question_answered = calculate_percentage_of_questions_answered(user_response.responses)
        user_response.ratio_completed = f"{total_question_answered}/{total_question_to_answer}"
        user_response.save()

        business.has_completed_questionnaire = True
        business.save()

        total_score = 0

        
        try:
            total_score = self.calculate_total_score(user_response.responses)
        except Exception as e:
            print(e)
            pass
        

        business_instance,created = BusinessScore.objects.get_or_create(user=user,business=business)
        business_instance.score = total_score
        business_instance.save()

        print(f'total score of {total_score} save')

        serializer = self.get_serializer(user_response)
        
        return Response(serializer.data,status=status.HTTP_201_CREATED)
 