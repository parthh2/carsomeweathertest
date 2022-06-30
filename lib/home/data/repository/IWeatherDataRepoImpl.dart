import 'package:carsomeweathertest/core/http/network_info.dart';
import 'package:carsomeweathertest/home/data/data_source/remote_weather_data_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../di/injection_container.dart';
import '../../../core/models/Failure.dart';
import '../../../core/models/Success.dart';
import '../../domain/IWeatherDataRepo.dart';
import '../models/current_weather_response_model.dart';

class IWeatherDataRepoImpl extends IWeatherDataRepo {
  final RemoteWeatherDataRepo remoteWeatherDataRepo = sl();

  IWeatherDataRepoImpl({required NetworkInfo networkInfo}) : super(networkInfo);

  @override
  Future<Either<Failure, Success>> getCurrentWeather(
          String lat, String lon, String appId) =>
      baseApiMethod(
        () => getCurrentWeatherApiCall(lat, lon, appId),
      );

  Future<Either<Failure, Success>> getCurrentWeatherApiCall(
      String lat, String lon, String appId) async {
    var response =
        await remoteWeatherDataRepo.getCurrentWeatherData(lat, lon, appId);
    if (response == null) {
      return Left(Failure(message: response, apiStatus: 0));
    } else {
      CurrentWeatherResponseModel responseModel =
          CurrentWeatherResponseModel.fromJson(response);
      Success dataModel = Success(responseModel);
      return Right(dataModel);
    }
  }
}
