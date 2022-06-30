import 'package:bloc/bloc.dart';

import '../models/Failure.dart';
import '../models/NoParams.dart';
import '../models/base_bloc/base_state.dart';

class MasterBloc extends Bloc<ApiStateEvents, BaseApiState> {
  late Failure objectModel;

  MasterBloc(BaseApiState initialState) : super(initialState);

  @override
  Stream<BaseApiState> mapEventToState(ApiStateEvents event) async* {
    if (event is LoadApiEvent) {
      yield ApiLoadingState();
    } else if (event is LoadedApiEvent) {
      yield ApiLoadedState();
    } else if (event is ErrorApiEvent) {
      ApiErrorState modelToPass = ApiErrorState(
        objectModel.message,
        objectModel.apiStatus,
        model: objectModel.model,
      );
      yield modelToPass;
    }
  }
}
