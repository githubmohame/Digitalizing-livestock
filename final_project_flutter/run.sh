#!/bin/bash
export Main_url=$(echo $NGROK_URL)
echo $Main_url
flutter run --dart-define=ServerDomain=$Main_url

