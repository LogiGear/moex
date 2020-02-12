import 'dart:async';

import 'package:moex/common/constants.dart';
import 'package:moex/screens/home/home_page.dart';
import 'package:moex/screens/onboarding/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/assets.dart';

class MoExApp extends StatelessWidget {
  final home = HomePage();
  final onboarding = OnboardingPage();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: Material(
        type: MaterialType.transparency,
        child: FutureBuilder<bool>(
          future: onboardingShown(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return home;
              } else {
                showOnboarding();
                return onboarding;
              }
            } else {
              return Container(
                color: Colors.white,
                child: Image.asset(Assets.logo),
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> onboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool wasShown = prefs.getBool(Constants.OnboardingShown) ?? false;

    return wasShown;
  }

  showOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.OnboardingShown, true);
  }
}
