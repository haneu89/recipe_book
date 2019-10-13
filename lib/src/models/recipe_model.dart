class RecipeModel {
  String id;
  String image;
  String title;
  int comment_count = 0;

  RecipeModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    image = parsedJson['image'];
    title = parsedJson['title'];
    comment_count = 0;
  }
  RecipeModel.fromSnapshot(dynamic snapshot) {
    id = snapshot.documentID;
    image = snapshot['image'];
    title = snapshot['title'];
    List<dynamic> test = snapshot['comments'];
    comment_count = (test != null) ? test.length : 0 ;
    
  }
}