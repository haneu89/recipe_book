import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment_model.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export '../models/comment_model.dart';

final String _doc = 'comments';

class CommentFireResource {
  // 싱글톤
  static final CommentFireResource _resource = CommentFireResource._internal();
  factory CommentFireResource() => _resource;
  CommentFireResource._internal();

  Future<DocumentReference> createComment(CommentModel comment) => Firestore.instance.collection(_doc).add(comment.toJson());
  
  Stream<QuerySnapshot> getComments(String target) {
    return Firestore.instance.collection(_doc).where('target', isEqualTo: target).snapshots();
  }


}