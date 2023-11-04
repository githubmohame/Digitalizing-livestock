ngrok http 192.168.1.6:8000  --domain=$NGROK_URL &
source ../backend_env/bin/activate
python manage.py runserver 192.168.1.6:8000