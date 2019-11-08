import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/favorite_model.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export '../models/favorite_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import './recipe_fire_resource.dart';

final String _doc = 'favorits';

class FavoriteFireResource {
  // 싱글톤
  static final FavoriteFireResource _resource = FavoriteFireResource._internal();
  factory FavoriteFireResource() => _resource;
  FavoriteFireResource._internal();

  RecipeFireResource recipeResource = RecipeFireResource();

  Future<DocumentReference> addFavorite(String recipeId) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return recipeResource.attachFavorite(recipeId, user.uid);
  }

  void removeFavorite(String recipeId) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
      return recipeResource.detachFavorite(recipeId, user.uid);
  }
  
  Stream<QuerySnapshot> getFavorites(target) =>  Firestore.instance.collection(_doc).where('target', isEqualTo: target).snapshots();

  Stream<DocumentSnapshot> getOwnFavorites(target, uid) =>  Firestore.instance.collection('recipes').document(target).snapshots();
  


}