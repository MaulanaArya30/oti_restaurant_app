class Category {
  String? id;
  String? title;
  String? userId;

  Category({
    required this.id,
    required this.title,
    required this.userId,
  });

  factory Category.fromJson(Map json) {
    return Category(
      id: json['id'],
      title: json['title'],
      userId: json['user_id'],
    );
  }
}
