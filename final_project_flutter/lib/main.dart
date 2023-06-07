import 'package:final_project_year/apis/apis_functions.dart';
import 'package:final_project_year/common_component/select_animal.dart';
import 'package:final_project_year/main_screens/bash_board_screen.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:final_project_year/main_screens/show_farm_info.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'package:final_project_year/main_screens/farmer_screen.dart';

import 'service/notifications.dart';

/*
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
*/
void main() async {
  SliverOpacity;
  /*Workmanager workmanager = Workmanager();
  workmanager.initialize(callbackDispatcher);
  workmanager.registerPeriodicTask(frequency: Duration(seconds: 3),
    "1",
    'iiiiiiii', //This is the value that will be returned in the callbackDispatcher
    initialDelay: Duration(minutes: 5),
    constraints: Constraints(networkType: NetworkType.connected),
  );*/ /*
  dio.Dio dio1 = dio.Dio();
  List<Polygon> plogons = [];
  List<Marker> marker = [];
  Response<List> res = await dio1.post<List>(
      "http://192.168.1.6:8000/get_data_map",
      queryParameters: {},
      options: dio.Options(responseType: ResponseType.json));
  for (var f in res.data!) {
    print(f["location"] != null);
    if (f['center' ]!= null) {
      Map m = json.decode(f["center"]);
      marker.add( Marker(
        point: LatLng(m["coordinates"][0], m["coordinates"][1]),
        builder: (context) {
          return ElevatedButton(onPressed: () {}, child: Text(f["farm_name"]));
        },
      ));
    }
    if (f["location"] != null) {
      Map m = json.decode(f["location"]);
      if (m['type'] == 'MultiPolygon') {
        for (List main1 in m['coordinates']) {
          for (List plog in main1) {
            List<LatLng> points = [];
            for (List p1 in plog) {
              points.add(LatLng(p1[0], p1[1]));
            }
            plogons.add(Polygon(points: points));
          }
        }
      }
      if (m['type'] == 'Polygon') {
        for (List main1 in m['coordinates']) {
          List<LatLng> points = [];
          for (List p1 in main1) {
            points.add(LatLng(p1[0], p1[1]));
          }
          plogons.add(Polygon(points: points));
        }
      }
    }
  }
  print(marker);*/
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

  /* void _updateConnectionStatus(ConnectivityResult c1) {
    NotificationServiceCustome.initializeLocalNotifications(message: c1.name);
  }
*/
  @override
  void initState() {
    //NotificationServiceCustome.displayNotificationRationale();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  FarmInfoScreen(farmId:123),
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