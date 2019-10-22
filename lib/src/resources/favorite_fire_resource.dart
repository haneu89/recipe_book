import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment_model.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export '../models/comment_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

final String _doc = 'favorits';

class FavoriteFireResource {
  // 싱글톤
  static final FavoriteFireResource _resource = FavoriteFireResource._internal();
  factory FavoriteFireResource() => _resource;
  FavoriteFireResource._internal();

  Future<DocumentReference> createFavorite(CommentModel comment) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    comment.userId = user.uid;
    comment.createdAt = DateTime.now();
    return Firestore.instance.collection(_doc).add(comment.toJson());
  } 
  
  Stream<QuerySnapshot> getFavorites(String target) {
    return Firestore.instance.collection(_doc)
      .where('target', isEqualTo: target)
      // .orderBy('createdAt', descending: true)
      .snapshots();
  }


}