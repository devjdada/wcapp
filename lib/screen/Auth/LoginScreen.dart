// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winners/api/AuthApi.dart';
import 'package:winners/screen/home/DashboardScreen.dart';
import 'package:winners/shared/themes.dart';
import 'package:winners/shared/widget/BackgroundImage.dart';
import 'package:winners/shared/widget/PasswordInput.dart';
import 'package:winners/shared/widget/RoundedButton.dart';
import 'package:winners/shared/widget/TextInputFieldIcon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _loginScript() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'user': _emailController.text,
      'device_name': _emailController.text,
      'password': _passwordController.text
    };

    bool log = await AuthApi().login(data);

    if (log) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const DashboardScreen()));
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/ft_church.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                flex: 2,
                child: Center(
                    child: Image(
                        image: AssetImage('assets/images/papa.png'),
                        fit: BoxFit.cover)),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: const Text(
                  'Dashboard',
                  style: kBodyText,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputFieldIcon(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    controller: _emailController,
                    textarea: false,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    controller: _passwordController,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: const Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
                    callback: _loginScript,
                    loading: _isLoading,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'register'),
                child: Container(
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                  child: const Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
