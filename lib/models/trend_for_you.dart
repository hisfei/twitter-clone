class Trend {
  final String title;
  final String topic;
  final int tweetCount;

  Trend({
    required this.title,
    required this.topic,
    required this.tweetCount,
  });

  // 工厂方法从JSON中创建Trend实例
  factory Trend.fromJson(Map<String, dynamic> json) {
    return Trend(
      title: json['title'] ?? '',
      topic: json['topic'] ?? '',
      tweetCount: json['tweetCount'] ?? 0,
    );
  }
}
