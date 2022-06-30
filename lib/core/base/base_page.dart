import 'package:carsomeweathertest/core/blocs/master_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/base_bloc/base_state.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => MasterBloc(BaseApiStateInitial()),
        child: getChildBlocWidget(context),
      );

  Widget getChildBlocWidget(BuildContext context);
}
