import 'package:flutter/material.dart';

import '../login/view/login_view.dart';

class Routes{
  static const String loginRoute = "/";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) =>
        Scaffold(
          appBar: AppBar(
            title: const Text('No route'), // todo implement in strings manager
          ),
          body: const Center(child: Text('no route found'),), // todo implement in strings manager
        ));
  }
}