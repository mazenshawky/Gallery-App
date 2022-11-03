import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/login/viewmodel/login_viewmodel.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
}

initLoginModule(){
  if(!GetIt.I.isRegistered<LoginViewModel>()) {
    instance.registerFactory<LoginViewModel>(() => LoginViewModel());
  }
}