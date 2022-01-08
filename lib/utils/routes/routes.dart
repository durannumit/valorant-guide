import 'package:valorant_guide/ui/detail/detail.dart';
import 'package:valorant_guide/ui/home/home.dart';
import 'package:valorant_guide/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String detail = '/detail';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(),
    detail: (BuildContext context) => DetailScreen(),
  };
}
