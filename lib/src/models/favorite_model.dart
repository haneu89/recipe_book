class FavoriteModel {
  String target;
  String id;
  String userId;
  dynamic createdAt;
  
  FavoriteModel.fromJson(Map<String, dynamic> parsedJson) {
    target = parsedJson['target'];
  }

  FavoriteModel.fromSnapshot(dynamic snapshot) {
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