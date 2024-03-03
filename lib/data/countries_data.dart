import 'package:smart_pay/common/app_assets.dart';

Map<String, dynamic> unitedStatesData = {
  'flag': AppAsset.unitedStatesFlag,
  'initials': 'US',
  'name': 'United States'
};

Map<String, dynamic> unitedKingdomData = {
  'flag': AppAsset.unitedKungdomFlag,
  'initials': 'UK',
  'name': 'United Kingdom'
};
Map<String, dynamic> indonesiaData = {
  'flag': AppAsset.indonesiaFlag,
  'initials': 'ID',
  'name': 'Indonesia'
};
Map<String, dynamic> singapoerData = {
  'flag': AppAsset.singaporeFlag,
  'initials': 'SG',
  'name': 'Singapore'
};
Map<String, dynamic> chinaData = {
  'flag': AppAsset.chinaFlag,
  'initials': 'CN',
  'name': 'China'
};
Map<String, dynamic> netherlandsData = {
  'flag': AppAsset.netherlandsFlag,
  'initials': 'NL',
  'name': 'Netherlands'
};

List<Map<String, dynamic>> countries = [
  unitedStatesData,
  unitedKingdomData,
  singapoerData,
  chinaData,
  netherlandsData,
  indonesiaData
];
