class Failure {
  Failure({this.message = "INTERNET_CONNECTION", this.apiStatus, this.model});

  dynamic model;
  final String? message;
  final int? apiStatus;
}

class InternetConnection extends Failure {
  InternetConnection();
}
