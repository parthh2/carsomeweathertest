import 'package:carsomeweathertest/home/data/data_source/remote_weather_data_repo.dart';
import 'package:carsomeweathertest/home/data/data_source/remote_weather_data_repo_impl.dart';
import 'package:carsomeweathertest/home/data/repository/IWeatherDataRepoImpl.dart';
import 'package:carsomeweathertest/home/domain/IWeatherDataRepo.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/http/http_client.dart';
import '../core/http/http_client_impl.dart';
import '../core/http/network_info.dart';
import '../core/http/network_info_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  Dio dio = Dio();
  sl.registerSingleton<Dio>(dio);
  sl.registerLazySingleton<RestClient>(() => RestClientImpl(dioClient: sl()));

  // API Domain
  sl.registerLazySingleton<IWeatherDataRepo>(
      () => IWeatherDataRepoImpl(networkInfo: sl()));

  // API Data Sources
  sl.registerLazySingleton<RemoteWeatherDataRepo>(
    () => RemoteActiveMemberDashBoardRepoImpl(restClient: sl()),
  );
}
