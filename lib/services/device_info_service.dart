import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService{

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

Future<String> androidInfo()async{
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
return androidInfo.model;
}


Future<String> iosInfo()async{
IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"
return iosInfo.utsname.machine;
}

}