import 'package:get_it/get_it.dart';
import 'package:smart_pay/services/authentication_service.dart';
import 'package:smart_pay/services/device_info_service.dart';
import 'package:smart_pay/services/network_service.dart';
import 'package:smart_pay/services/toast_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<NetworkService>(NetworkService());
  getIt.registerSingleton<AutheticationService>(AutheticationService());
  getIt.registerSingleton<DeviceInfoService>(DeviceInfoService());
  getIt.registerSingleton<ToastService>(ToastService());
}
