import 'package:smart_pay/app/locator.dart';
import 'package:smart_pay/features/about/model/sign_up_request_model.dart';
import 'package:smart_pay/features/sign_in/model/sign_in_model.dart';
import 'package:smart_pay/features/sign_up/model/email_verification_model.dart';
import 'package:smart_pay/features/verify_user/model/token_verification_model.dart';
import 'package:smart_pay/model/generic_response_model.dart';
import 'package:smart_pay/services/network_service.dart';

class AutheticationService {
  NetworkService _networkService = getIt<NetworkService>();

  GenericResponseModel? genericResponseModel;

  Future<Map<String, dynamic>> signIn(SignInModel data) async {
    Map<String, dynamic> response =
        await _networkService.post('/auth/login', data: data.toMap());
    return response;
  }

  Future<Map<String, dynamic>> signUp(SignUpRequestModel data) async {
    Map<String, dynamic> response =
        await _networkService.post('/auth/register', data: data.toMap());
    return response;
  }

  Future<Map<String, dynamic>> emailVerification(
      EmailVerificationModel data) async {
    Map<String, dynamic> response =
        await _networkService.post('/auth/email', data: data.toMap());
    return response;
  }

  Future<Map<String, dynamic>> tokenVerification(
      TokenVerificationModel data) async {
    Map<String, dynamic> response =
        await _networkService.post('/auth/email/verify', data: data.toMap());
    return response;
  }
}
