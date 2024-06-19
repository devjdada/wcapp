import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winners/api/UserApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/UserSchema.dart';
import 'package:winners/screen/profile/include/ProfileBody.dart';
import 'package:winners/screen/profile/include/ProfileHeader.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(this.logUser, {super.key});
  final LogUserSchema logUser;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late int userID;
  bool isSavingContact = false;
  bool isSavingReport = false;
  bool isInitUser = false;
  bool loading = false;
  bool loadingReport = false;
  bool loadingAssigned = false;
  late UserSchema user;
  bool loadingUserData = true;
  bool loadingUserInfo = false;
  late String type;

  @override
  void initState() {
    userID = widget.logUser.user!.id!.toInt();
    loadUserData();
    super.initState();
  }

  Future loadUserData() async {
    var response = await UserApi().getUser(userID);
    setState(() {
      user = response;
      loadingUserInfo = true;
      if (user.data!.dob == null || user.data!.dob!.isEmpty) {
        editProfile();
      }
    });
  }

  editProfile() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Edit Your Profile",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var linearGradient = const BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          Color(0xFF413070),
          Color(0xFF2B264A),
        ],
      ),
    );

    return Scaffold(
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: linearGradient,
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileHeader(
                widget.logUser,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ProfileBody(widget.logUser),
              ),
              loadingUserInfo
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Card(
                            elevation: 2,
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: linearGradient,
                                  child: Image.asset(
                                    'assets/images/ft_church.jpg',
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Soul Won",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text(
                                    user.data!.souls!.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Card(
                            elevation: 2,
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: linearGradient,
                                  child: Image.asset(
                                    'assets/images/ft_church.jpg',
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Contact Assigned to You",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    user.data!.assigned!.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Card(
                            elevation: 2,
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: linearGradient,
                                  child: Image.asset(
                                    'assets/images/ft_church.jpg',
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Text(
                                      "Reported Contact",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    user.data!.report!.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Loader(),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: PopupMenuButton(
        child: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: const LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.redAccent,
                Colors.red,
              ],
            ),
          ),
          child: const Icon(
            FontAwesomeIcons.gear,
            color: Colors.white,
            size: 20,
          ),
        ),
        onSelected: (result) {},
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 1,
            child: Text("New Contact"),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text("WSF Report"),
          ),
          const PopupMenuItem(
            value: 3,
            child: Text("New Convert"),
          ),
          const PopupMenuItem(
            value: 4,
            child: Text("First Timer"),
          ),
          const PopupMenuItem(
            value: 5,
            child: Text("District Leader"),
          )
        ],
      ),
    );
  }
}
