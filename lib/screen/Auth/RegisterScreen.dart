import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:winners/api/AuthApi.dart';
import 'package:winners/api/StationApi.dart';
import 'package:winners/schema/StationBasicSchema.dart';
import 'package:winners/screen/home/DashboardScreen.dart';
import 'package:winners/shared/themes.dart';
import 'package:winners/shared/widget/BackgroundImage.dart';
import 'package:winners/shared/widget/PasswordInput.dart';
import 'package:winners/shared/widget/RoundedButton.dart';

import 'package:winners/shared/widget/TextInputFieldIcon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  bool loadingStation = false;
  late StationBasicSchema stations;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cPasswordController = TextEditingController();
  String? stationValue;

  @override
  void initState() {
    super.initState();
    getStations();
  }

  _registerScript() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': _emailController.text,
      'username': _phoneController.text,
      'name': _nameController.text,
      'station_id': stationValue,
      'phone': _phoneController.text,
      'password': _passwordController.text,
      'confirm_password': _cPasswordController.text,
      'weddingAniversary': null,
      'birthday': null
    };

    bool reg = await AuthApi().register(data); // Added await

    if (reg) {
      Get.to(const DashboardScreen());
    }
    setState(() {
      _isLoading = false;
    });
  }

  getStations() async {
    var sta = await StationApi().getStationAndId();
    if (sta.data != null && sta.data!.isNotEmpty) {
      setState(() {
        stationValue = sta.data!.first.id.toString();
        stations = sta;
        loadingStation = true; // Initialize with the first station id
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/ft_church.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                const Center(
                    child: Image(
                        image: AssetImage('assets/images/papa.png'),
                        fit: BoxFit.cover)),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    loadingStation == false
                        ? const Center(
                            child: Text(
                              "Select Station",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Icon(
                                      Icons.church,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor: kPrimary,
                                    style: kBodyText,
                                    value: stationValue,
                                    items: stations.data!
                                        .map<DropdownMenuItem<String>>(
                                            (Data value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(
                                            value.location ??
                                                'Unknown location',
                                            style: kBodyText),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        stationValue = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                    TextInputFieldIcon(
                      icon: FontAwesomeIcons.user,
                      hint: 'Full Name',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: _nameController,
                      textarea: false,
                    ),
                    TextInputFieldIcon(
                      icon: FontAwesomeIcons.phone,
                      hint: 'Phone',
                      inputType: TextInputType.phone,
                      inputAction: TextInputAction.next,
                      controller: _phoneController,
                      textarea: false,
                    ),
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
                      inputAction: TextInputAction.next,
                      controller: _passwordController,
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                      controller: _cPasswordController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        buttonName: 'Register',
                        callback: _registerScript,
                        loading: _isLoading),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
