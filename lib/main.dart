import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/screen/Auth/LoginScreen.dart';
import 'package:winners/screen/Auth/RegisterScreen.dart';
import 'package:winners/screen/home/DashBoardScreen.dart';
import 'package:winners/screen/welcome/WelcomeScreen.dart';
import 'package:winners/shared/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Winners Chapel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        useMaterial3: true,
      ),
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => WelcomeScreen(),
        'dashboard': (context) => const DashboardScreen(),
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
      },
      getPages: [
        GetPage(name: '/welcome', page: () => WelcomeScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/my-contact/:user', page: () => const RegisterScreen()),
      ],
    );
  }
}
