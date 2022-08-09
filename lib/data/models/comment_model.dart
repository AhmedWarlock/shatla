class CommentModel {
  final String text;
  final String postID;
  final String commenterID;
  final int likes;
  CommentModel({
    required this.commenterID,
    required this.text,
    required this.postID,
    required this.likes,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'commenterID': commenterID,
      'likes': likes,
      'postID': postID,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> snapshot) {
    return CommentModel(
        commenterID: snapshot['commenterID'],
        text: snapshot['text'],
        postID: snapshot['postID'],
        likes: snapshot['likes']);
  }
}
