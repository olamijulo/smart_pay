import 'package:dio/dio.dart';
import 'package:smart_pay/exceptions/smart_pay_exception.dart';

mixin ErrorHandling {
  void handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      throw SmartPayException(
          message:
              "Opps, this is taking too long. Check your network and try again.");
    }

    if (e.type == DioExceptionType.connectionError) {
      throw SmartPayException(
          message: "Please check your internet connection and try again.");
    }

    if (e.type == DioExceptionType.unknown) {
      throw SmartPayException(
          message: "Something occured at this time. Please try again.");
    }

    if (e.response?.statusCode == 500) {
      throw SmartPayException(message: "Service is unavailable at this time.");
    }
  }
}
