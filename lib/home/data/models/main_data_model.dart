class MainDataModel {
  double? feels_like;
  double? grnd_level;
  double? humidity;
  double? pressure;
  double? sea_level;
  double? temp;
  double? temp_max;
  double? temp_min;

  MainDataModel({
    required this.feels_like,
    required this.grnd_level,
    required this.humidity,
    required this.pressure,
    required this.sea_level,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
  });

  MainDataModel.fromJson(Map<String, dynamic> map) {
    feels_like = (map['feels_like'] == null)
        ? 0.0
        : double.parse(map['feels_like'].toString());
    grnd_level = (map['grnd_level'] == null)
        ? 0.0
        : double.parse(map['grnd_level'].toString());
    humidity = (map['humidity'] == null)
        ? 0.0
        : double.parse(map['humidity'].toString());
    pressure = (map['pressure'] == null)
        ? 0.0
        : double.parse(map['pressure'].toString());
    sea_level = (map['sea_level'] == null)
        ? 0.0
        : double.parse(map['sea_level'].toString());
    temp = (map['temp'] == null) ? 0.0 : double.parse(map['temp'].toString());
    temp_max = (map['temp_max'] == null)
        ? 0.0
        : double.parse(map['temp_max'].toString());
    temp_min = (map['temp_min'] == null)
        ? 0.0
        : double.parse(map['temp_min'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['feels_like'] = this.feels_like;
    data['grnd_level'] = this.grnd_level;
    data['humidity'] = this.humidity;
    data['pressure'] = this.pressure;
    data['sea_level'] = this.sea_level;
    data['temp'] = this.temp;
    data['temp_max'] = this.temp_max;
    data['temp_min'] = this.temp_min;
    return data;
  }
}
