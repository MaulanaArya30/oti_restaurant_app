class Category {
  int id;
  String title;
  String description;
  String userId;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      userId: json['user_id'],
    );
  }
}
