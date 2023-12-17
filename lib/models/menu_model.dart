class Menu {
  String? id;
  String? title;
  int? price;
  String? thumbnail;
  String? categoryId;
  bool? visible;
  bool? soldOut;
  String? userId;
  String? description;

  Menu(
      {required this.id,
      required this.title,
      required this.price,
      required this.thumbnail,
      required this.categoryId,
      required this.visible,
      required this.soldOut,
      required this.userId,
      required this.description});

  factory Menu.fromJson(Map json) {
    return Menu(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        thumbnail: json['thumbnail'],
        categoryId: json['category'],
        visible: json['visible'],
        soldOut: json['sold_out'],
        userId: json['user_id'],
        description: json['description']);
  }
}
