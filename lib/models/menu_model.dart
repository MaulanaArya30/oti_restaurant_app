class Menu {
  String id;
  String title;
  int price;
  String thumbnail;
  int categoryId;
  bool visible;
  bool soldOut;
  String userId;

  Menu({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.categoryId,
    required this.visible,
    required this.soldOut,
    required this.userId,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      thumbnail: json['thumbnail'],
      categoryId: json['category_id'],
      visible: json['visible'],
      soldOut: json['sold_out'],
      userId: json['user_id'],
    );
  }
}
