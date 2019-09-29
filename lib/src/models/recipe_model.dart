class RecipeModel {
  String id;
  String image;
  String title;

  RecipeModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    image = parsedJson['image'];
    title = parsedJson['title'];
  }
  RecipeModel.fromSnapshot(dynamic snapshot) {
    id = snapshot.documentID;
    image = snapshot['image'];
    title = snapshot['title'];
    
  }
}