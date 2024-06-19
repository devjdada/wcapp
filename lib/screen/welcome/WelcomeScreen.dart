import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:winners/api/AuthApi.dart';
import 'package:winners/screen/Auth/LoginScreen.dart';
import 'package:winners/screen/home/DashboardScreen.dart';
import 'package:winners/shared/data/AppStore.dart';
import 'package:winners/shared/themes.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool islog = false;

  @override
  void initState() {
    super.initState();
    initUserData();
  }

  initUserData() async {
    islog = await AuthApi().isUserLogin();
    if (islog) {
      Get.to(const DashboardScreen());
    }
  }

  final List<Introduction> list = [
    Introduction(
      title: 'Proverbs 11:30',
      subTitle: 'he who wins souls is wise.',
      imageUrl: 'assets/images/onboarding3.png',
    ),
    Introduction(
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/onboarding2.png',
    ),
    Introduction(
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/onboarding2.png',
    ),
    Introduction(
      title: 'Receive Money',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/onboarding1.png',
    ),
    Introduction(
      title: 'Receive Second',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/onboarding1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Theme.of(context).colorScheme.inversePrimary,
      foregroundColor: primary,
      introductionList: list,
      onTapSkipButton: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          )),
      skipTextStyle: const TextStyle(
        color: Colors.blueGrey,
        fontSize: 18,
      ),
    );
  }
}
