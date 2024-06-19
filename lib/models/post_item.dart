class PostItem {
  final bool isIdea;
  final int postCode;
  final String postType;
  final String title;
  final String tag;
  final String authorCode;
  final String authorName;
  final String authorAvatar;
  final String createdAt;
  final String replyAuthorCode;
  final String replyAuthorName;
  final String replyAuthorAvatar;
  final int replyCode;
  final List<String> imageUrls;
  final String replyContent;
  final int likeCount;
  final int viewCount;
  final int commentCount;

  PostItem({
    required this.isIdea,
    required this.postCode,
    required this.postType,
    required this.title,
    required this.tag,
    required this.authorCode,
    required this.authorName,
    required this.authorAvatar,
    required this.createdAt,
    required this.replyAuthorCode,
    required this.replyAuthorName,
    required this.replyAuthorAvatar,
    required this.replyCode,
    required this.imageUrls,
    required this.replyContent,
    required this.likeCount,
    required this.viewCount,
    required this.commentCount,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) {
    return PostItem(
      isIdea: json['isIdea'],
      postCode: json['postCode'],
      postType: json['postType'],
      title: json['title'],
      tag: json['tag'] ?? '',
      authorCode: json['authorCode'],
      authorName: json['authorName'],
      authorAvatar: json['authorAvatar'],
      createdAt: json['createdAt'],
      replyAuthorCode: json['replyAuthorCode'],
      replyAuthorName: json['replyAuthorName'],
      replyAuthorAvatar: json['replyAuthorAvatar'],
      replyCode: json['replyCode'],
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      replyContent: json['replyContent'] ?? '',
      likeCount: json['likeCount'] ?? 0,
      viewCount: json['viewCount'] ?? 0,
      commentCount: json['commentCount'] ?? 0,
    );
  }
}
