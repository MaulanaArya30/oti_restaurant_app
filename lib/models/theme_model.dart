class ThemeModel {
  DateTime? createdAt;
  String? background;
  String? foreground;
  String? primary;
  String? primaryForeground;
  String? secondary;
  String? secondaryForeground;
  String? border;
  String? userId;
  String? card;

  ThemeModel(
      {this.createdAt,
      this.background,
      this.foreground,
      this.primary,
      this.primaryForeground,
      this.secondary,
      this.secondaryForeground,
      this.border,
      this.userId,
      this.card});

  factory ThemeModel.fromJson(Map json) => ThemeModel(
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      background: json["background"],
      foreground: json["foreground"],
      primary: json["primary"],
      primaryForeground: json["primary_foreground"],
      secondary: json["secondary"],
      secondaryForeground: json["secondary_foreground"],
      border: json["border"],
      userId: json["user_id"],
      card: json["card"]);

  Map toJson() => {
        "created_at": createdAt?.toIso8601String(),
        "background": background,
        "foreground": foreground,
        "primary": primary,
        "primary_foreground": primaryForeground,
        "secondary": secondary,
        "secondary_foreground": secondaryForeground,
        "border": border,
        "user_id": userId,
        "card": card
      };
}
