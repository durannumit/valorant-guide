import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:valorant_guide/constants/colors.dart';
import 'package:valorant_guide/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Center(
        child: Container(
          height: 64,
          width: 64,
          child: SvgPicture.asset('assets/icons/valorant_icon.svg'),
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }
}
