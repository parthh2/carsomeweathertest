import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/api_response.dart';
import 'ApiConstants.dart';

part 'http_helper.g.dart';

//flutter pub run build_runner build
@RestApi(baseUrl: "")
abstract class RestHelper {
  factory RestHelper(Dio dio, {String? baseUrl}) = _RestHelper;

  @GET(GET_WEATHER)
  Future<dynamic> getCurrentWeatherData(
    @Query("lat") String lat,
    @Query("lon") String lon,
    @Query("appid") String appid,
  );
}
