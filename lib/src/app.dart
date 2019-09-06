import 'package:flutter/material.dart';
import '../src/screens/recipe/recipe_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'recipe',
      routes: {
        'recipe': (context) => RecipeList(),
      },
    );
  }
}
