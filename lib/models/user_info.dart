class UserInfo {
  final String userCode;
  final String userName;
  final String joinDate;
  final String bio;
  final String followingCount;
  final String followerCount;
  final String mjCount;
  final bool verified;
  final String backgroundUrl;
  final String userAvatar;

  UserInfo(
      {this.userCode = '',
      this.userName = '',
      this.joinDate = '',
      this.bio = '',
      this.followingCount = '',
      this.followerCount = '',
      this.mjCount = '',
      this.verified = false,
      this.backgroundUrl = '',
      this.userAvatar = ''});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userCode: json['userCode'] ?? '',
      userName: json['userName'] ?? '',
      joinDate: json['joinDate'] ?? '',
      bio: json['bio'] ?? '',
      followingCount: json['followingCount'] ?? '0',
      followerCount: json['followerCount'] ?? '0',
      mjCount: json['mjCount'] ?? '',
      verified: json['verified'] ?? false,
      backgroundUrl: json['backgroundUrl'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
    );
  }
}
