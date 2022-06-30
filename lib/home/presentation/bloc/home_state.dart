import '../../data/models/current_weather_response_model.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class GetCurrentWeatherDataState extends HomeState {
  final CurrentWeatherResponseModel responseModel;

  GetCurrentWeatherDataState({required this.responseModel});
}
