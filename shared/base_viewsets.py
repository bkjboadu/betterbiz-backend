from rest_framework import viewsets,permissions
from rest_framework.permissions import IsAdminUser
from rest_framework_simplejwt.authentication import JWTAuthentication

class CustomBaseViewSet(viewsets.ModelViewSet):
    '''
    Base viewset that dynamically sets authentication and permission based on where the user is an admin.
    '''
    def is_admin_user(self,request):
        return request.user and request.user.is_staff
    
    def get_permissions(self):
        if self.is_admin_user(self.request):
            return [IsAdminUser]
        return [permissions.IsAuthenticated()]
    
    def get_authentication_classes(self):
        if self.is_admin_user(self.request):
            return [JWTAuthentication]
        return [JWTAuthentication]


        

