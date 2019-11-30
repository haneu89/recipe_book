class CommentModel {
  String target;
  String id;
  String content;
  String userId;
  String name;
  String profile;
  dynamic createdAt;
  
  CommentModel.fromJson(Map<String, dynamic> parsedJson) {
    target = parsedJson['target'];
    content = parsedJson['content'];
  }

  CommentModel.fromSnapshot(dynamic snapshot) {
    target = snapshot.target;
    id = snapshot.documentID;
    content = snapshot['content'];
    profile = snapshot['profile'];
    userId = snapshot['userId'];
    name = snapshot['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      "target": target,
      "content": content,
      "profile": profile,
      "userId": userId,
      "createdAt": createdAt,
      "name": name,
    };
  }
}