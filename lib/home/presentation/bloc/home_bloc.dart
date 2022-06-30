import 'package:carsomeweathertest/core/blocs/master_bloc.dart';
import 'package:carsomeweathertest/home/domain/IWeatherDataRepo.dart';

import '../../../core/base/base_bloc.dart';
import '../../../core/models/NoParams.dart';
import '../../../di/injection_container.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc({MasterBloc? baseBlocObject})
      : super(baseBlocObject, HomeStateInitial());

  final IWeatherDataRepo weatherDataRepo = sl();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetCurrentWeatherDataEvent) {
      baseBlocObject!.add(LoadApiEvent());
      final output = await weatherDataRepo.getCurrentWeather(
        event.lat,
        event.lon,
        event.appId,
      );
      yield* output.fold(
        (failure) async* {
          print(failure);
          baseBlocObject!.objectModel = failure;
          baseBlocObject!.add(ErrorApiEvent());
        },
        (responseModel) async* {
          baseBlocObject!.add(LoadedApiEvent());
          await Future.delayed(const Duration(milliseconds: 300));
          yield GetCurrentWeatherDataState(responseModel: responseModel.model);
        },
      );
    }
  }
}
