import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/api/AuthApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/screen/Assigned/MyAssignedContact.dart';
import 'package:winners/screen/contact/ContactReportScreen.dart';
import 'package:winners/screen/contact/MyContactScreen.dart';
import 'package:winners/screen/dev/underDev.dart';
import 'package:winners/screen/home/DashboardScreen.dart';
import 'package:winners/screen/homecell/HomecellScreen.dart';
import 'package:winners/screen/profile/ProfileScreen.dart';
import 'package:winners/shared/data/AppStore.dart';
import 'package:winners/shared/data/AppString.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late LogUserSchema userInfo;
  late LogUserSchema setEmpty;
  late LogUserSchema logUser;
  bool loadingUserData = false;

  initUserData() async {
    var userRef = await AppStore.getUserData();
    try {
      var decodeUser = LogUserSchema.fromJson(json.decode(userRef!));
      setState(() {
        userInfo = decodeUser;
        loadingUserData = true;
      });
    } catch (e) {
      print(e);
    }
  }

  logOutNow() async {
    bool logout = await AuthApi().logOut();
    if (logout) {
      Get.offAllNamed('/login');
    }
  }

  @override
  void initState() {
    initUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loadingUserData == false
        ? Container()
        : Container(
            decoration: const BoxDecoration(color: Colors.black87),
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "${userInfo.user!.name} ",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  accountEmail: Text("${userInfo.user!.email}",
                      style: const TextStyle(fontSize: 16.0)),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage("${userInfo.user!.profilePhotoUrl}"),
                    ),
                    onTap: () => print("This is your current account."),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppString.drawerAccountBg),
                          fit: BoxFit.fill)),
                ),
                ListTile(
                  title: const Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.dashboard,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(const DashboardScreen());
                  },
                ),
                ListTile(
                  enabled: loadingUserData,
                  title: const Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.portrait,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          userInfo,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  enabled: loadingUserData,
                  title: const Text(
                    "My Contact",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.portrait,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyContactScreen(
                          user: userInfo,
                        ),
                        settings:
                            const RouteSettings(name: 'profile', arguments: []),
                      ),
                    );
                  },
                ),
                ListTile(
                  enabled: loadingUserData,
                  title: const Text(
                    "Assigned Contact",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.portrait,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyAssignedContact(
                              user: userInfo,
                            ),
                        settings: const RouteSettings(
                            name: 'profile', arguments: [])));
                  },
                ),
                ListTile(
                  enabled: loadingUserData,
                  title: const Text(
                    "Contact Report",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.person_pin_outlined,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ContactReportScreen(
                              userInfo,
                            ),
                        settings: const RouteSettings(
                            name: 'profile', arguments: [])));
                  },
                ),
                ListTile(
                  title: const Text(
                    "Media",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.shuffle_on,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(const UnderDev());
                  },
                ),
                ListTile(
                  title: const Text(
                    "Giving Online",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.monetization_on,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(const UnderDev());
                  },
                ),
                ListTile(
                  title: const Text(
                    "Blog ",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.assignment_returned,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(const UnderDev());
                  },
                ),
                ListTile(
                  title: const Text(
                    "Homecell",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HomecellScreen("${userInfo.user!.stationId}"),
                        settings: const RouteSettings(
                            name: 'profile', arguments: [])));
                  },
                ),
                ListTile(
                  title: const Text(
                    "LogOut",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.lock,
                    color: Colors.white70,
                    size: 24,
                  ),
                  onTap: () {
                    logOutNow();
                  },
                ),
              ],
            ),
          );
  }
}
