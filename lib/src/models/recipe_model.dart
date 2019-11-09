class RecipeModel {
  String id;
  String image;
  String title;
  String subtitle;
  String content;
  int cookingtime;
  int commentCount;
  int favoriteCount;

  RecipeModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    image = parsedJson['image'];
    title = parsedJson['title'];
    subtitle = parsedJson['subtitle'];
    content = parsedJson['content'];
    cookingtime = parsedJson['cookingtime'];
    commentCount = 0;
    favoriteCount = 0;
  }
  RecipeModel.fromSnapshot(dynamic snapshot) {
    id = snapshot.documentID;
    image = snapshot['image'];
    title = snapshot['title'];
    subtitle = snapshot['subtitle'];
    content = snapshot['content'];
    cookingtime = snapshot['cookingtime'];
    List<dynamic> comList = snapshot['comments'];
    commentCount = (comList != null) ? comList.length : 0 ;
    List<dynamic> favList = snapshot['favorits'];
    favoriteCount = (favList != null) ? favList.length : 0 ;
    
  }
}