import 'package:get_it/get_it.dart';
import 'package:trucktech_automobiles/model/AddVehicles/basic_details_claimNo_Amount_Model.dart';

import '../utlis/assets/app_string.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AppString>(() => AppString());
  getIt.registerLazySingleton<BasicDetailsClaimnoAmountModel>(
      () => BasicDetailsClaimnoAmountModel());
}
