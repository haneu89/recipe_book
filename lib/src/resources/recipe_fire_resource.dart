import 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

final String _doc = 'recipes';

class RecipeFireResource {

  // 싱글톤
  static final RecipeFireResource _resource = RecipeFireResource._internal();
  factory RecipeFireResource() => _resource;
  RecipeFireResource._internal();

  Stream<QuerySnapshot> get getItemList => Firestore.instance.collection(_doc).snapshots();

}