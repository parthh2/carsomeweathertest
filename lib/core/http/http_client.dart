import 'package:carsomeweathertest/core/http/http_helper.dart';

abstract class RestClient {
  Future<RestHelper> getClient();
}
