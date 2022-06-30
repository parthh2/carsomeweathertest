abstract class BaseApiState {
  const BaseApiState();
}

class BaseApiStateInitial extends BaseApiState {}

class ApiLoadingState extends BaseApiState {}

class ApiLoadedState extends BaseApiState {}

class ApiErrorState extends BaseApiState {
  final String? message;
  final int? apiStatus;
  final dynamic model;

  ApiErrorState(
    this.message,
    this.apiStatus, {
    this.model,
  }) : super();
}
