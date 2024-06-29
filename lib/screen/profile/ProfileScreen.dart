import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:winners/api/HomecellApi.dart';
import 'package:winners/api/UserApi.dart';
import 'package:winners/schema/HomecellsSchema.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/UserSchema.dart';
import 'package:winners/screen/profile/JoinUnitScreen.dart';
import 'package:winners/screen/profile/include/ProfileBody.dart';
import 'package:winners/screen/profile/include/ProfileHeader.dart';
import 'package:winners/search/HomecellSearch.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';
import 'package:winners/shared/themes.dart';

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
  late HomecellsSchema homecells;

  bool _isEditing = false;

  String? _selectedDate;
  String? _selectedGender;
  String? _selectedMaritalStatus;
  final TextEditingController _addressController = TextEditingController();

  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  _editScript() async {
    setState(() {
      _isEditing = true;
    });
    var data = {
      'dob': _selectedDate,
      'marital': _selectedMaritalStatus,
      'gender': _selectedGender,
      'address': _addressController.text
    };
    if (_selectedDate != null ||
        _selectedGender != null ||
        _selectedMaritalStatus != null) {
      await UserApi().editUser(user.me!.id, data);
      setState(() {
        _isEditing = false;
      });
      loadUserData();
    }
  }

  @override
  void initState() {
    userID = widget.logUser.user!.id!.toInt();
    loadUserData();
    _joinHomecell();
    super.initState();
  }

  Future loadUserData() async {
    var response = await UserApi().getUser(userID);
    setState(() {
      user = response;
      loadingUserInfo = true;
      if (user.me!.dob == null || user.me!.dob!.isEmpty) {
        editProfile();
      }
    });
  }

  editProfile() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Cancel",
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Edit Your Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ListTile(
                          title: const Text('Birthday'),
                          subtitle: Text(_selectedDate.toString()),
                          trailing: const Icon(Icons.keyboard_arrow_down),
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            ).then((pickedDate) {
                              setState(() {
                                _selectedDate =
                                    pickedDate.toString().split(' ')[0];
                              });
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedGender,
                          hint: const Text('Select Gender'),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedGender = newValue;
                            });
                          },
                          items: genders
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Marital Status Dropdown with Icon
                  Row(
                    children: [
                      const Icon(Icons.family_restroom),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _selectedMaritalStatus,
                          hint: const Text('Select Marital Status'),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedMaritalStatus = newValue;
                            });
                          },
                          items: maritalStatuses
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Address Text Box with Icon
                  Row(
                    children: [
                      const Icon(Icons.home),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _addressController,
                          keyboardType: TextInputType.streetAddress,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(!_isEditing ? 'Update' : "Waiting..."),
                        onPressed: () {
                          if (!_isEditing) {
                            _editScript();
                            Navigator.of(context).pop();
                          }
                          // Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                          activityStacts('assets/images/soul_wining.jpg',
                              "Soul Won", user.me!.souls!.length.toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          activityStacts(
                              'assets/images/assigned.jpg',
                              "COntact Assigned",
                              user.me!.assigned!.length.toString()),
                          const SizedBox(
                            height: 5,
                          ),
                          activityStacts(
                              "assets/images/assigned.jpg",
                              "Reported Contact",
                              user.me!.report!.length.toString()),
                          const SizedBox(
                            height: 4,
                          ),
                          Card(
                            margin: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                            elevation: 10,
                            child: Center(
                              child: user.homecell == null
                                  ? Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: InkWell(
                                        onTap: () {
                                          showSearch(
                                            context: context,
                                            delegate: HomecellSearch(homecells),
                                          );
                                        },
                                        child: const Center(
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.add,
                                                size: 40,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                "Join Homecell",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              user.homecell!.title.toString(),
                                              style: heading3,
                                            ),
                                          ),
                                          Center(
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  user.homecell!.address
                                                      .toString(),
                                                  style: heading6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                        user.homecell!.province
                                                                ?.title ??
                                                            "",
                                                        style: heading6),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      user.homecell!.district
                                                              ?.title ??
                                                          "",
                                                      style: heading6,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Row(
                                  children: user.units!
                                      .map(
                                        (e) => SizedBox(
                                          width: screenWidth * 0.7,
                                          height: screenWidth * 0.35,
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    e.title.toString(),
                                                    style: heading3,
                                                  ),
                                                  Text(
                                                    e.about.toString(),
                                                    style: heading6,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.7,
                                  height: screenWidth * 0.35,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(const JoinUnitScreen());
                                        },
                                        child: const Column(
                                          children: [
                                            Icon(
                                              Icons.add_card_outlined,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              'Join a Unit',
                                              style: heading6,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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

  activityStacts(image, header, number) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 50,
            child: Image.asset(image, fit: BoxFit.fill),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                header,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(
              number,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }

  _joinHomecell() async {
    var h = await HomecellApi().getHomecells(userID);
    setState(() {
      homecells = h;
    });
  }
}
