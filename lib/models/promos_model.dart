class Promo {
  int id;
  String thumbnail;
  bool visible;
  String userId;

  Promo({
    required this.id,
    required this.thumbnail,
    required this.visible,
    required this.userId,
  });

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      id: json['id'],
      thumbnail: json['thumbnail'],
      visible: json['visible'],
      userId: json['user_id'],
    );
  }
}
