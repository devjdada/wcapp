import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:winners/api/AuthApi.dart';
import 'package:winners/screen/Auth/LoginScreen.dart';
import 'package:winners/screen/home/DashboardScreen.dart';
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
      title: 'Welcome',
      subTitle: 'Fortune 2024',
      imageUrl: 'assets/images/papa.png',
    ),
    Introduction(
      title: 'Pro. 11:30',
      subTitle: 'he who wins souls is wise.',
      imageUrl: 'assets/images/logo.png',
    ),
    Introduction(
      title: 'Caller Squard',
      subTitle: 'Join Caller Squard to followup invitte through phone call',
      imageUrl: 'assets/images/caller.png',
      imageHeight: 200,
      imageWidth: 200,
    ),
    Introduction(
      title: 'Family',
      subTitle: 'Welcome to the Family',
      imageUrl: 'assets/images/ft_church.jpg',
      imageHeight: 200,
      imageWidth: 200,
    ),
    Introduction(
      title: 'Developer',
      subTitle: 'https://www.echotronicsng.com/',
      imageUrl: 'assets/images/echotronic logo.png',
      imageHeight: 200,
      imageWidth: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: Colors.black87,
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
