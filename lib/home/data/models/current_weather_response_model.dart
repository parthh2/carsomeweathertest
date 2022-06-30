import 'package:carsomeweathertest/home/data/models/coord_model.dart';
import 'package:carsomeweathertest/home/data/models/main_data_model.dart';
import 'package:carsomeweathertest/home/data/models/wind_data_model.dart';

class CurrentWeatherResponseModel {
  String? base;
  double? visibility;
  double? dt;
  double? timezone;
  double? id;
  int? cod;
  String? name;
  CoordModel? coordModel;
  MainDataModel? mainDataModel;
  WindDataModel? windDataModel;

  CurrentWeatherResponseModel({
    required this.base,
    this.visibility,
    this.dt,
    this.timezone,
    this.id,
    this.cod,
    this.name,
    this.coordModel,
    this.mainDataModel,
    this.windDataModel,
  });

  CurrentWeatherResponseModel.fromJson(Map<String, dynamic> map) {
    base = map['base'];
    visibility = (map['visibility'] == null)
        ? 0.0
        : double.parse(map['visibility'].toString());
    dt = (map['dt'] == null) ? 0.0 : double.parse(map['dt'].toString());
    cod = map['cod'];
    timezone = (map['timezone'] == null)
        ? 0.0
        : double.parse(map['timezone'].toString());
    name = map['name'];
    coordModel =
        map['coord'] != null ? CoordModel.fromJson(map['coord']) : null;
    mainDataModel =
        map['main'] != null ? MainDataModel.fromJson(map['main']) : null;
    windDataModel =
        map['wind'] != null ? WindDataModel.fromJson(map['wind']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['base'] = base;
    data['visibility'] = visibility;
    data['dt'] = dt;
    data['timezone'] = timezone;
    data['cod'] = cod;
    data['name'] = name;
    if (coordModel != null) {
      data['coord'] = coordModel!.toJson();
    }
    if (mainDataModel != null) {
      data['main'] = mainDataModel!.toJson();
    }
    if (windDataModel != null) {
      data['wind'] = windDataModel!.toJson();
    }
    return data;
  }
}
