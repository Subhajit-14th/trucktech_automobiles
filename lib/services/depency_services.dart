import 'package:get_it/get_it.dart';

import '../utlis/assets/app_string.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AppString>(() => AppString());
}
