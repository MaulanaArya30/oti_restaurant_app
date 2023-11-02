class StoreModel {
  int id;
  String storeName;
  String thumbnail;
  String email;
  String userId;

  StoreModel({
    required this.id,
    required this.storeName,
    required this.thumbnail,
    required this.email,
    required this.userId,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'],
        storeName: json['store_name'],
        thumbnail: json['thumbnail'],
        email: json['email'],
        userId: json['user_id'],
      );
}
