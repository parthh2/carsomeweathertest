abstract class RemoteWeatherDataRepo {
  Future<dynamic> getCurrentWeatherData(String lat, String lon, String appId);
}
