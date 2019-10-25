import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment_model.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export '../models/comment_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import './recipe_fire_resource.dart';

final String _doc = 'comments';

class CommentFireResource {
  // 싱글톤
  static final CommentFireResource _resource = CommentFireResource._internal();
  factory CommentFireResource() => _resource;
  CommentFireResource._internal();

  RecipeFireResource recipeResource = RecipeFireResource();


  Future<DocumentReference> createComment(CommentModel comment) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    comment.userId = user.uid;
    comment.createdAt = DateTime.now();

    DocumentReference comRef = await Firestore.instance.collection(_doc).add(comment.toJson());
    recipeResource.attachFavorite(comment.id, comRef.documentID);

    return comRef;


  } 
  
  Stream<QuerySnapshot> getComments(String target) {
    return Firestore.instance.collection(_doc)
      .where('target', isEqualTo: target)
      // .orderBy('createdAt', descending: true)
      .snapshots();
  }


}