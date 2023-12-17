class Promo {
  int? id;
  String? thumbnail;
  bool? visible;
  String? userId;
  String? promoPhoto;

  Promo(
      {required this.id,
      required this.thumbnail,
      required this.visible,
      required this.userId,
      required this.promoPhoto});

  factory Promo.fromJson(Map json) {
    return Promo(
        id: json['id'],
        thumbnail: json['thumbnail'],
        visible: json['visible'],
        userId: json['user_id'],
        promoPhoto: json['promo_photo']);
  }
}
