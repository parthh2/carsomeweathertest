abstract class HomeEvent {}

class GetCurrentWeatherDataEvent extends HomeEvent {
  final String lat, lon, appId;

  GetCurrentWeatherDataEvent(
      {required this.lat, required this.lon, required this.appId});
}
