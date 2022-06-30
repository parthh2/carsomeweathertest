import 'dart:async';

import 'package:carsomeweathertest/core/base/base_bloc_widget.dart';
import 'package:carsomeweathertest/core/strings/string_constants.dart';
import 'package:carsomeweathertest/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/Utils.dart';
import '../../../core/util/app_constants.dart';
import '../../data/models/current_weather_response_model.dart';
import '../../data/models/location_model.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeScreen extends BaseBlocWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseBlocWidgetState<HomeScreen> {
  CurrentWeatherResponseModel? currentWeatherResponseModel;
  LocationModel? currentLocationModel;

  StreamController<LocationModel> locationStreamController =
      StreamController<LocationModel>.broadcast();

  @override
  void initState() {
    currentLocationModel = locationModels[0];
    super.initState();
    callApi();
  }

  callApi() {
    if (currentLocationModel != null) {
      BlocProvider.of<HomeBloc>(context).add(GetCurrentWeatherDataEvent(
        lat: currentLocationModel!.latitude,
        lon: currentLocationModel!.longitude,
        appId: WEATHER_API_KEY,
      ));
    }
  }

  @override
  Widget getCustomBloc() => Scaffold(
        appBar: AppBar(
          title: const Text("Weather Data"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                StreamBuilder<LocationModel>(
                    stream: locationStreamController.stream,
                    builder: (context, snapshot) => Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black26,
                                  offset: Offset(0, 2))
                            ],
                          ),
                          child: DropdownButton<LocationModel>(
                            value: currentLocationModel,
                            items: locationModels
                                .map((LocationModel value) =>
                                    DropdownMenuItem<LocationModel>(
                                      value: value,
                                      child: Text(
                                        value.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              currentLocationModel = value;
                              locationStreamController
                                  .add(currentLocationModel!);
                              currentWeatherResponseModel = null;
                              callApi();
                            },
                            isDense: true,
                          ),
                        )),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (_, state) {
                    if (state is GetCurrentWeatherDataState) {
                      currentWeatherResponseModel = state.responseModel;
                    }
                    if (currentWeatherResponseModel == null) {
                      return const Text(
                        "No Data",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      );
                    }
                    return getDataWidget();
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget getDataWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCardWidget(
            TEMPERATURE,
            Utils.convertKelvinToCelsius(
                currentWeatherResponseModel?.mainDataModel?.temp ?? 0),
          ),
          getCardWidget(
            TEMPERATURE_MIN,
            Utils.convertKelvinToCelsius(
                currentWeatherResponseModel?.mainDataModel?.temp_min ?? 0),
          ),
          getCardWidget(
            TEMPERATURE_MAX,
            Utils.convertKelvinToCelsius(
                currentWeatherResponseModel?.mainDataModel?.temp_max ?? 0),
          ),
          getCardWidget(
            PRESSURE,
            "${(currentWeatherResponseModel?.mainDataModel?.pressure ?? 0).toInt()}",
          ),
          getCardWidget(
            HUMIDITY,
            "${(currentWeatherResponseModel?.mainDataModel?.humidity ?? 0).toInt()}",
          ),
        ],
      );

  Widget getCardWidget(String key, String value) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );

  @override
  dispose() {
    locationStreamController.close();
    super.dispose();
  }

  List<LocationModel> locationModels = [
    LocationModel(
      name: "Kuala Lumpur",
      latitude: "3.138675",
      longitude: "101.6169492",
    ),
    LocationModel(
      name: "George Town",
      latitude: "5.4059643",
      longitude: "100.274327",
    ),
    LocationModel(
      name: "Johor Bahru",
      latitude: "1.5450255",
      longitude: "103.639587",
    ),
    LocationModel(
      name: "Kuantan",
      latitude: "3.8089082",
      longitude: "103.1242163",
    ),
    LocationModel(
      name: "Kuala Terengganu",
      latitude: "5.4845334",
      longitude: "102.7478046",
    ),
    LocationModel(
      name: "Kelantan",
      latitude: "5.3966785",
      longitude: "101.4394778",
    ),
    LocationModel(
      name: "Phuket",
      latitude: "7.8309254",
      longitude: "98.079737",
    ),
  ];
}
