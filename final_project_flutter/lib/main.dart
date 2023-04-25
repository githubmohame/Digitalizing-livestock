import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:final_project_year/main_screens/farmer_screen.dart';
import 'package:final_project_year/service/background.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:local_auth/local_auth.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:workmanager/workmanager.dart';
import 'service/notifications.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print('kiii');
    WebSocketChannel websocket = WebSocketChannel.connect(
      Uri.parse('ws://192.168.1.6:8000/server'),
    );
    websocket.stream.listen((event) {});

    return Future.value(true);
  });
}

void main() async {
  SliverOpacity;
  /*Workmanager workmanager = Workmanager();
  workmanager.initialize(callbackDispatcher);
  workmanager.registerPeriodicTask(frequency: Duration(seconds: 3),
    "1",
    'iiiiiiii', //This is the value that will be returned in the callbackDispatcher
    initialDelay: Duration(minutes: 5),
    constraints: Constraints(networkType: NetworkType.connected),
  );*/
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

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

class _MyAppState extends State<MyApp> {
  late final NotificationServiceCustome notificationService;
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

  /* void _updateConnectionStatus(ConnectivityResult c1) {
    NotificationServiceCustome.initializeLocalNotifications(message: c1.name);
  }
*/
  @override
  void initState() {
    //NotificationServiceCustome.displayNotificationRationale();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FarmerScreen(),
    );
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

    /*  return FutureBuilder(
        future: AwesomeNotifications()
            .getInitialNotificationAction(removeFromActionEvents: true),
        builder: (context, snap) {
         if (snap.connectionState == ConnectionState.done) {
            print(snap.data);
            print('object' * 90);
            return MaterialApp(
              navigatorKey: MyApp.navigatorKey,
              initialRoute: '',
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                    builder: (context) => Builder(builder: (context2) {
                          initializeService();
                          return Scaffold(
                            body: Center(
                                child: TextButton(
                              onPressed: () {},
                              child: const Text('jjj'),
                            )),
                          );
                        }));
              },
            );
          }
          
          return MaterialApp(
              theme: ThemeData(useMaterial3: true),
              home: Scaffold(
                body: Transform.scale(
                    scale: 5,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                    )),
              ));
        });*/
  }
}
 



/*
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
        Using LayoutBuilder to calculate the amount of
        items to print depending on screen height
      */
      home: LayoutBuilder(
        builder: (context, box) => Scaffold(
          body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerScrolled) => [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        forceElevated: innerScrolled,
                        pinned: true,
                        title: Text(
                            "Printing ${(box.maxHeight / 20).floor()} items"),
                      ),
                    ),
                  ],
              body: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Card(
                      color: Colors.amber,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 100,
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(120),
                            height: 123,
                            color: Colors.black,
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      height: 1200,
                        child: CustomScrollView( shrinkWrap: true,
                          slivers: [
                            SliverList(delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Container(color: Colors.green,);
                              },
                            ))
                          ],
                        ));
                  }
                },
              )),
        ),
      ),
    );
  }
}

void main() => runApp(TestPage());
*/