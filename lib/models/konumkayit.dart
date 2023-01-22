class KayitModel {
  KayitModel(
      {required this.lat1,
      required this.lat2,
      required this.lon1,
      required this.lon2});
  double lat1;
  double lat2;
  double lon1;
  double lon2;
  factory KayitModel.fromJson(json) => KayitModel(
        lat1: json["lat1"] ?? 0,
        lat2: json["lat2"] ?? 0,
        lon1: json["lon1"] ?? 0,
        lon2: json["lon2"] ?? 0,
      );

  toJson() {
    return {"lat1": lat1, "lat2": lat2, "lon1": lon1, "lon2": lon2};
  }
}
