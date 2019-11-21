import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../src/screens/recipe/recipe_list.dart';
import '../src/screens/recipe/recipe_show.dart';
import '../src/screens/bookmark/bookmark_list.dart';
import '../src/screens/base/config_screen.dart';
import '../src/screens/user/user_profile.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


class MyApp extends StatefulWidget {

  final String initialRoute;

  MyApp({this.initialRoute});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // onResume내 context가 참조가 다른 문제를 해결하기 위하여 참조
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
        onLaunch: (Map<String, dynamic> message) async {
    }, onMessage: (Map<String, dynamic> message) async {
    }, onResume: (Map<String, dynamic> message) async {
      navigatorKey.currentState.pushNamed(message['data']['screen']);
    }, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black38
      ),
      initialRoute: widget.initialRoute,
      routes: {
        'recipe': (context) => RecipeList(),
        'bookmark': (context) => BookMarkList(),
        'config': (context) => ConfigScreen(),
        'user': (context) => UserProfile(),
      },
      onGenerateRoute: _onGeneratedRoute,
    );
  }

  Route<dynamic> _onGeneratedRoute(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');

    if (pathElements[0] == 'recipe') {
      final String paramId = pathElements[1];
      return MaterialPageRoute(builder: (BuildContext context) {
        return RecipeShow(paramId);
      });
    }
  }
}
