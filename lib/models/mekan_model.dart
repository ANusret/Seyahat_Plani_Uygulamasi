class MekanModel {
  String ad;
  double puan;
  double lat;
  double lng;

  MekanModel(
      {required this.ad,
      required this.puan,
      required this.lat,
      required this.lng});

  factory MekanModel.fromJson(json) {
    return MekanModel(
        ad: json["adi"] ?? "",
        puan: double.tryParse((json["Puan"] ?? 0).toString()) ?? 0,
        lat: double.tryParse((json["Lat"] ?? 0).toString()) ?? 0,
        lng: double.tryParse((json["Lon"] ?? 0).toString()) ?? 0);
  }

  toJson() {
    return {"ad": ad, "puan": puan, "lat": lat, "lon": lng};
  }
}
