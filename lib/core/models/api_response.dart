class ApiResponse {
  String? message;
  dynamic data;
  int? statusCode;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    statusCode = json['statusCode'];
  }
}
