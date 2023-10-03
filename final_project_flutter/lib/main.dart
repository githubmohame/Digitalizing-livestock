import 'package:flutter/foundation.dart';
import 'package:final_project_year/main_screens/jail_broken_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:local_auth/local_auth.dart';
import 'package:secure_application/secure_application.dart';
import 'main_screens/biometric_screen.dart';
import 'main_screens/login.dart';
import 'service/notifications.dart';

/*
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
     WebSocketChannel websocket = WebSocketChannel.connect(
      Uri.parse('ws://192.168.1.6:8000/server'),
    );
    websocket.stream.listen((event) {});

    return Future.value(true);
  });
}
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  await NotificationServiceCustome.initializeLocalNotifications();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late final NotificationServiceCustome notificationService;
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void initState() {
    //NotificationServiceCustome.displayNotificationRationale();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
   }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
          
          if (defaultTargetPlatform ==TargetPlatform.android ||  defaultTargetPlatform==TargetPlatform.iOS) {
            FutureBuilder(
              future: FlutterJailbreakDetection.jailbroken,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return JailBreakScreen();
                }
                return const BimetricScreen();
              },
            );
          }
          if  (defaultTargetPlatform==TargetPlatform.windows) {
            return const BimetricScreen();
          } else {
             return LogIN();
          }
        }),
    );
  }
}
