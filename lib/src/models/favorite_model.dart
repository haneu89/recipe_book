class CommentModel {
  String target;
  String id;
  String userId;
  dynamic createdAt;
  
  CommentModel.fromJson(Map<String, dynamic> parsedJson) {
    target = parsedJson['target'];
  }

  CommentModel.fromSnapshot(dynamic snapshot) {
    target = snapshot.target;
    id = snapshot.documentID;
    userId = snapshot['userId'];
  }

  Map<String, dynamic> toJson() {
    return {
      "target": target,
      "userId": userId,
      "createdAt": createdAt,
    };
  }
}