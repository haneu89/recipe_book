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

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.subscribeToTopic('new');

    _firebaseMessaging.configure(
        onLaunch: (Map<String, dynamic> message) async {
      print("on launch : $message");
    }, onMessage: (Map<String, dynamic> message) async {
      print('on message : $message');
      // Navigator.of(context).pushNamed(message['data']['screen']);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume : $message');
      Navigator.of(context).pushNamed(message['data']['screen']);
    }, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
