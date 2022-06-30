import 'package:dio/dio.dart';

import 'http_client.dart';
import 'http_helper.dart';

class RestClientImpl extends RestClient {
  RestClientImpl({required this.dioClient});

  final Dio dioClient;

  @override
  Future<RestHelper> getClient() async {
    return RestHelper(dioClient);
  }
}
