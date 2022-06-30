class WindDataModel {
  double? deg;
  double? gust;
  double? speed;

  WindDataModel({
    required this.deg,
    required this.gust,
    required this.speed,
  });

  WindDataModel.fromJson(Map<String, dynamic> map) {
    deg = (map['deg'] == null) ? 0.0 : double.parse(map['deg'].toString());
    gust = (map['gust'] == null) ? 0.0 : double.parse(map['gust'].toString());
    speed =
        (map['speed'] == null) ? 0.0 : double.parse(map['speed'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    data['speed'] = this.speed;
    return data;
  }
}
