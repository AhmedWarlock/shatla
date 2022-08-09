class PostModel {
  final String text;
  final String userID;
  final String pictureURL;
  final int likes;
  PostModel({
    required this.text,
    required this.userID,
    required this.pictureURL,
    required this.likes,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userID': userID,
      'pictureURL': pictureURL,
      'likes': likes,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> snapshot) {
    return PostModel(
        text: snapshot['text'],
        userID: snapshot['userID'],
        pictureURL: snapshot['pictureURL'],
        likes: snapshot['likes']);
  }
}
