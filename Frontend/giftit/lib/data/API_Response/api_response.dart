import 'package:giftit/data/API_Response/status.dart';

class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  const ApiResponse(this.status, this.data, this.message);
  const ApiResponse.initial()
      : status = Status.initial,
        data = null,
        message = null;
  const ApiResponse.loading()
      : status = Status.loading,
        data = null,
        message = null;
  const ApiResponse.success(this.data)
      : status = Status.success,
        message = null;
  const ApiResponse.failure(this.message)
      : status = Status.failure,
        data = null;

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}
