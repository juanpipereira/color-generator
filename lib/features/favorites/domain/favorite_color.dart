class FavoriteColor {
  FavoriteColor(this.code);
  final String code;

  factory FavoriteColor.fromJson(Map<String, dynamic> json) =>
      FavoriteColor(json['code']);

  Map<String, dynamic> toJson([int? id]) => {
        'code': this.code,
        'id': id,
      };
}
