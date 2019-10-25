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
    FavoriteModel favorite = FavoriteModel.fromJson({ 'target' : recipeId });
    favorite.userId = user.uid;
    favorite.createdAt = DateTime.now();
    
    DocumentReference favRef = await Firestore.instance.collection(_doc).add(favorite.toJson());
    recipeResource.attachFavorite(recipeId, favRef.documentID);
    return favRef;
  }

  void removeFavorite(String recipeId, String favoriteId) async {
      await Firestore.instance.collection(_doc).document(favoriteId).delete();
      recipeResource.detachFavorite(recipeId, favoriteId);
  }
  
  Stream<QuerySnapshot> getFavorites(String target) {
    return Firestore.instance.collection(_doc)
      .where('target', isEqualTo: target)
      .snapshots();
  }


}