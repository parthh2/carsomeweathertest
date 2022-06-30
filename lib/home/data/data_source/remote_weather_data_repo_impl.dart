import '../../../core/http/http_client.dart';
import '../../../core/http/http_helper.dart';
import 'remote_weather_data_repo.dart';

class RemoteActiveMemberDashBoardRepoImpl implements RemoteWeatherDataRepo {
  final RestClient? restClient;

  RemoteActiveMemberDashBoardRepoImpl({this.restClient});

  @override
  Future<dynamic> getCurrentWeatherData(
      String lat, String lon, String appId) async {
    RestHelper helper = await restClient!.getClient();
    return helper.getCurrentWeatherData(lat, lon, appId);
  }
}
