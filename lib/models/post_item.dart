class PostItem {
  final int postCode;
  final String postType;
  final String title;
  final String tag;
  final String userCode;
  final String userName;
  final String userAvatar;
  final String createdAt;
  final int replyCode;
  final List<String> imageUrls;
  final bool isVerified;
  final String content;
  final int likeCount;
  final int viewCount;
  final int commentCount;

  PostItem({
    required this.postCode,
    required this.postType,
    required this.title,
    required this.tag,
    required this.userCode,
    required this.userName,
    required this.userAvatar,
    required this.createdAt,
    required this.replyCode,
    required this.imageUrls,
    required this.content,
    required this.likeCount,
    required this.viewCount,
    required this.commentCount,
    required this.isVerified,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) {
    try {
      return PostItem(
        isVerified: json['isVerified'] ?? false,
        postCode: json['postCode'],
        postType: json['postType'],
        title: json['title'],
        tag: json['tag'] ?? '',
        userCode: json['userCode'],
        userName: json['userName'],
        userAvatar: json['userAvatar'],
        createdAt: json['createdAt'] ?? '',
        replyCode: json['replyCode'],
        imageUrls: List<String>.from(json['imageUrls'] ?? []),
        content: json['content'] ?? '',
        likeCount: json['likeCount'] ?? 0,
        viewCount: json['viewCount'] ?? 0,
        commentCount: json['commentCount'] ?? 0,
      );
    } catch (e) {
      print(e);
    }
    return PostItem(
      isVerified: json['isVerified'] ?? false,
      postCode: json['postCode'],
      postType: json['postType'],
      title: json['title'],
      tag: json['tag'] ?? '',
      userCode: json['userCode'],
      userName: json['userName'],
      userAvatar: json['userAvatar'],
      createdAt: json['createdAt'] ?? '',
      replyCode: json['replyCode'],
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      content: json['content'] ?? '',
      likeCount: json['likeCount'] ?? 0,
      viewCount: json['viewCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
    );
  }
}
