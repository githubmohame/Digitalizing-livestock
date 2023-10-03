from rest_framework.pagination import PageNumberPagination

class CustomePagenation(PageNumberPagination):
	page_size=10