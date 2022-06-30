import 'package:bloc/bloc.dart';

import '../blocs/master_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(
    this.baseBlocObject,
    State initialState,
  ) : super(initialState);

  final MasterBloc? baseBlocObject;
}
