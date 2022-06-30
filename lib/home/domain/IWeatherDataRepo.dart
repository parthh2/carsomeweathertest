import 'package:dartz/dartz.dart';

import '../../../core/apirepo/BaseApiRepo.dart';
import '../../core/http/network_info.dart';
import '../../core/models/Failure.dart';
import '../../core/models/Success.dart';

abstract class IWeatherDataRepo extends BaseApiRepo {
  IWeatherDataRepo(NetworkInfo? networkInfo) : super(networkInfo);

  Future<Either<Failure, Success>> getCurrentWeather(
      String lat, String lon, String appId);
}
