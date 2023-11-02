class StoreModel {
  int? id;
  String? storeName;
  String? thumbnail;
  String? email;
  String? userId;

  StoreModel({
    this.id,
    this.storeName,
    this.thumbnail,
    this.email,
    this.userId,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'],
        storeName: json['store_name'],
        thumbnail: json['thumbnail'],
        email: json['email'],
        userId: json['user_id'],
      );
}
