import 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

final String _doc = 'recipes';

class RecipeFireResource {

  // 싱글톤
  static final RecipeFireResource _resource = RecipeFireResource._internal();
  factory RecipeFireResource() => _resource;
  RecipeFireResource._internal();

  Stream<QuerySnapshot> get getItemList => Firestore.instance.collection(_doc).snapshots();
  
  Stream<QuerySnapshot> getBookMarkList(uid) => Firestore.instance.collection(_doc).where('favorits', arrayContains: uid).snapshots();

  Stream<DocumentSnapshot> getItemOne(recipeId) => Firestore.instance.collection(_doc).document(recipeId).snapshots();


  attachComment(String recipeId, String commentId) {
    Firestore.instance.collection(_doc).document(recipeId).updateData({
      'comments': FieldValue.arrayUnion([commentId])
    });
  }
  detachComment(String recipeId, String commentId) {
    Firestore.instance.collection(_doc).document(recipeId).updateData({
      'comments': FieldValue.arrayRemove([commentId])
    });
  }
  attachFavorite(String recipeId, String userId) {
    Firestore.instance.collection(_doc).document(recipeId).updateData({
      'favorits': FieldValue.arrayUnion([userId])
    });
  }
  detachFavorite(String recipeId, String userId) {
    Firestore.instance.collection(_doc).document(recipeId).updateData({
      'favorits': FieldValue.arrayRemove([userId])
    });
  }
}