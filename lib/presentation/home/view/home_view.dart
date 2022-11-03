import 'package:flutter/material.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * .66,
          height: size.width * .11,
          child: ElevatedButton(
            onPressed: (){
              _logout();
            },
            child: const Text(
              AppStrings.logOut,
            ),
          ),
        ),
      ),
    );
  }

  _logout(){
    _appPreferences.logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
