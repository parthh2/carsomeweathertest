import 'dart:async';

import 'package:dartz/dartz.dart';

import '../http/network_info.dart';
import '../models/Failure.dart';
import '../models/Success.dart';

abstract class BaseApiRepo {
  final NetworkInfo? networkInfo;

  BaseApiRepo(this.networkInfo);

  Future<Either<Failure, Success>> baseApiMethod(
      Future<Either<Failure, Success>> Function() apiCall) async {
    bool isConnected = await networkInfo!.isConnected;

    if (!isConnected) {
      return internetConnectionException();
    }
    try {
      return await apiCall();
    } catch (e) {
      return internetConnectionException();
    }
  }

  Left<Failure, Success> internetConnectionException() => Left(
        Failure(
          message: "INTERNET_CONNECTION",
          apiStatus: 400,
        ),
      );
}
