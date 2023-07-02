from django.apps import AppConfig


class DigitalLivestockConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'digital_livestock'
    def ready(self) -> None:
        import digital_livestock.signals 
        return super().ready()
