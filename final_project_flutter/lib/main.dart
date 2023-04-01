import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cron/cron.dart';
import 'package:final_project_year/backgroundservice/backgroundservice.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:final_project_year/main_screens/connect_farm_farmer_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/main_screens/home.dart';
import 'package:final_project_year/main_screens/change_password_screen.dart';
import 'package:final_project_year/main_screens/list_farm.dart';
import 'package:final_project_year/main_screens/login.dart';
import 'package:final_project_year/main_screens/supplier_screeen.dart';
import 'package:final_project_year/main_screens/workers_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:secure_application/secure_application.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:workmanager/workmanager.dart';

import 'common_component/custome_secure_storage.dart';
import 'common_component/notifications.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print('kiii');
    WebSocketChannel websocket = WebSocketChannel.connect(
      Uri.parse('ws://192.168.1.6:8000/server'),
    );
    websocket.stream.listen((event) {
      print(event);
      NotificationService.showNotification(message: event.toString());
    });

    return Future.value(true);
  });
}

void main() async {
  /*Workmanager workmanager = Workmanager();
  workmanager.initialize(callbackDispatcher);
  workmanager.registerPeriodicTask(frequency: Duration(seconds: 3),
    "1",
    'iiiiiiii', //This is the value that will be returned in the callbackDispatcher
    initialDelay: Duration(minutes: 5),
    constraints: Constraints(networkType: NetworkType.connected),
  );*/
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await initializeService();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final NotificationService notificationService;
  final LocalAuthentication auth = LocalAuthentication();
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  Future<bool> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      return authenticated;
    } on PlatformException catch (e) {
      print(e);

      return false;
    }
  }

  void _updateConnectionStatus(ConnectivityResult c1) {
    print('kkkuuuu' * 78);
    print(c1);
    NotificationService.showNotification(message: c1.name);
  }

  @override
  void initState() {
    notificationService = NotificationService();
    
      
    /* Workmanager workmanager = Workmanager();
    workmanager.initialize(callbackDispatcher, isInDebugMode: false);
    workmanager.registerOneOffTask('background', 'background-task');
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus); */

    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    /*
    return FutureBuilder(
        future: _authenticateWithBiometrics(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
             
            if (snap.data!) {
              return SecureApplication(nativeRemoveDelay: 800,onNeedUnlock: (secureApplicationStateNotifier ) async{
                var authResult = await auth.authenticate(localizedReason:  '');
              },
                child: MaterialApp(
                  theme: ThemeData(useMaterial3: true),
                  debugShowCheckedModeBanner: false,
                  home: FarmScreen(),
                ),
              );
            }
            return MaterialApp(
              home: Scaffold(
                  body: SafeArea(
                child: Text('iiiii'),
              )),
            );
          }

          return MaterialApp(
            home: Scaffold(
                body: SafeArea(
              child: Text('uuuuuu'),
            )),
          );
        });*/
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {},
        child: Text('jjj'),
      )),
    ));
    ;
  }
}
