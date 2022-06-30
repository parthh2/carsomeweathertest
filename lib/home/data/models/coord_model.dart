class CoordModel {
  double? lat;
  double? lon;

  CoordModel({
    required this.lat,
    required this.lon,
  });

  CoordModel.fromJson(Map<String, dynamic> map) {
    lat = (map['lat'] == null) ? 0.0 : double.parse(map['lat'].toString());
    lon = (map['lon'] == null) ? 0.0 : double.parse(map['lon'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
