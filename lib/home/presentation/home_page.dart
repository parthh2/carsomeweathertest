import 'package:carsomeweathertest/core/base/base_page.dart';
import 'package:carsomeweathertest/core/blocs/master_bloc.dart';
import 'package:carsomeweathertest/home/presentation/bloc/home_bloc.dart';
import 'package:carsomeweathertest/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  Widget getChildBlocWidget(BuildContext context) => BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          baseBlocObject: BlocProvider.of<MasterBloc>(context),
        ),
        child: const HomeScreen(),
      );
}
