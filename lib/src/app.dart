import 'package:flutter/material.dart';
import '../src/screens/recipe/recipe_list.dart';
import '../src/screens/recipe/recipe_show.dart';
import '../src/screens/bookmark/bookmark_list.dart';
import '../src/screens/base/config_screen.dart';
import '../src/screens/user/user_profile.dart';


class MyApp extends StatelessWidget {

  String initialRoute;

  MyApp({this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
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
