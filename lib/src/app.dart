import 'package:flutter/material.dart';
import '../src/screens/recipe/recipe_list.dart';
import '../src/screens/recipe/recipe_show.dart';

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
