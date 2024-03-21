from django.shortcuts import get_object_or_404
from .models import Industry,Category,SpecificQuestion,AnswerOption
from .serializer import CategorySerializer,IndustrySerializer
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import viewsets
from rest_framework.decorators import action
from .forms import SpecificQuestionForm,AnswerOptionForm
from rest_framework.authentication import TokenAuthentication


class IsSuperUser(permissions.BasePermission):
    '''
    Custom permission to only allow superusers to edit,update, or delete.
    '''

    def has_permission(self, request, view):
        return request.user and request.user.is_superuser


class IndustryViewSet(viewsets.ModelViewSet):
    queryset = Industry.objects.all()
    serializer_class = IndustrySerializer
    permission_classes = []
    authentication_classes = []

    def get_permissions(self):
        '''
        Instantiates and returns the list of permissions that this view requires.
        '''
        if self.action in ['update','partial_update','destroy']:
            permission_classes = [IsSuperUser]
        else:
            permission_classes = self.permission_classes
        return [permission() for permission in permission_classes]

    @action(detail=True,methods=['GET'],permission_classes=[],authentication_classes=[])
    def questions(self,request,pk=None):
        response_data = []
        industry = Industry.objects.get(pk=pk)
        base_categories = [category.name for category in industry.categories.all()]
        industry_serializer = IndustrySerializer(industry)
        base_categories.insert(1,industry.name +' specific')

        for category in base_categories:
            try:
                category_object = Category.objects.get(name=category)
                category_serializer = CategorySerializer(category_object)
                response_data.append(category_serializer.data)
            except Category.DoesNotExist:
                pass

        serialized_data = {
            'industry': industry_serializer.data,
            'categories':response_data
        }

        return Response(serialized_data)

    @action(detail=True,methods=['GET','POST'],url_path='add-category')
    def add_category_to_industry(self,request,pk=None):
        category_name = request.data.get('category_name',"")
        try:
            category = Category.objects.get(name=category_name)
        except (TypeError,ValueError,OverflowError,Category.DoesNotExist):
            category = None

        message = ""
        if category:
            industry = Industry.objects.get(pk=pk)
            industry.categories.add(category)
            industry.save()
            message = f"{category.name} Category added to {industry.name} Industry"
        print(message)
        return Response({"status":message})

    @action(detail=True,methods=['GET'],url_path='remove-category/(?P<category_id>[^/.]+)')
    def remove_category_from_industry(self,request,pk=None,category_id=None):
        message = 'bright'
        print(category_id,pk)
        try:
            category = Category.objects.get(id=category_id)
            industry = Industry.objects.get(id=pk)
            print(category,industry)
        except (TypeError,ValueError,OverflowError,Category.DoesNotExist,Industry.DoesNotExist) as e:
            print(e)
            return Response({'status':message})

        if category and industry:
            category.industries.remove(industry)
            message = f"{industry.name} Industry removed from Category {category.name} "
        return Response({"status":message})


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = []
    authentication_classes = []

    def get_permissions(self):
        if self.action in ['update','partial_update','destroy']:
            permission_classes = [IsSuperUser]
        else:
            permission_classes = self.permission_classes
        return [permission() for permission in permission_classes]

    @action(detail=True,methods=['POST'],url_path='add-question')
    def add_question(self,request,pk=None):
        category = Category.objects.get(id=pk)
        data = request.data
        print(data)
        question = data.get('question','')
        description = data.get('description','')
        options = data.get('options','')

        message = ''
        if question and category and (options is not None):
            question_object = SpecificQuestion.objects.create(question=question,description=description,category_id=category.id)
            question_object.save()
            for option in options:
                option_object = AnswerOption.objects.create(option_text = option.get('option_text',""),points=option.get('points',''),question_id=question_object.id)
                option_object.save()
            message = f"question and options has been created"

        return Response({"status":message})

    @action(detail=True,methods=['GET'],url_path='remove-question/(?P<question_id>[^/.]+)')
    def remove_question(self,request,pk=None,question_id=None):
        question = SpecificQuestion.objects.get(id=question_id,category_id=pk)
        message = question.question
        question.delete()
        return Response({'status':message})

    @action(detail=True,methods=['POST'],url_path='edit-question/(?P<question_id>[^/.]+)')
    def edit_question(self,request,pk=None,question_id=None):
        question = get_object_or_404(SpecificQuestion,pk=question_id)
        question_form = SpecificQuestionForm(request.data,instance=question)

        if question_form.is_valid():
            question_form.save()

            options = request.data.get('answer_options','')
            for option_data in options:
                option_id = option_data.get('id')
                if option_id:
                    option = get_object_or_404(AnswerOption,pk=option_id)
                    option_form = AnswerOptionForm(option_data,instance=option)
                else:
                    option_form = AnswerOptionForm(option_data)

                if option_form.is_valid():
                    option_form.save()
                else:
                    pass

            message = 'Question and options updated'
        else:
            message = 'Invalid data'
        return Response({'status':message})
