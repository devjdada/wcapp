// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/api/UserApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/MyContactSchema.dart';
import 'package:winners/screen/contact/ContactDetalScreen.dart';
import 'package:winners/screen/contact/NewReportScreen.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';
import 'package:winners/shared/themes.dart';
import 'package:winners/shared/widget/BackgroundImage.dart';
import 'package:winners/shared/widget/TextInputFieldIcon.dart';

class MyContactScreen extends StatefulWidget {
  final LogUserSchema user;
  const MyContactScreen({Key? key, required this.user}) : super(key: key);
  @override
  _MyContactScreenState createState() => _MyContactScreenState();
}

class _MyContactScreenState extends State<MyContactScreen> {
  // final AnalyticsService _analyticsService = AnalyticsService();
  late Map data;
  late List userData;
  late MyContactSchema myContact;
  late MyContactSchema MyInvittees;

  bool isSavingContact = false;
  bool isInitUser = false;
  bool loading = false;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  late LogUserSchema user;

  // static const List<SoulActionMenuList> choices = <SoulActionMenuList>[
  //   SoulActionMenuList(
  //       icon: Icon(Icons.perm_contact_calendar),
  //       title: Text("Assigned"),
  //       link: "assign"),
  //   SoulActionMenuList(
  //       icon: Icon(Icons.mode_edit),
  //       title: Text("Report"),
  //       link: "soul_view_report"),
  // ];

  @override
  void initState() {
    super.initState();
    getData(widget.user.user!.id);
    getLogUser();
  }

  getLogUser() async {
    var u = await UserApi().getLogUser();
    setState(() {
      loading = false;
      user = u;
    });
  }

  _saveNewContact() async {
    // initUserProfile();
    // if (isInitUser == true) {
    var soulWinnerController = widget.user.user!.id;
    var stationIdController = widget.user.user?.stationId;
    var name = _nameController.text;
    List names = name.split(" ");
    var firstname, surname;
    if (names.length > 1) {
      firstname = names[0];
      surname = names[1];
    } else {
      firstname = name;
      surname = "";
    }
    setState(() {
      isSavingContact = true;
    });
    var data = {
      'name': _nameController.text,
      'surname': surname,
      'firstname': firstname,
      'phone': _phoneController.text,
      'location': _locationController.text,
      'soul_winner': soulWinnerController,
      'date': '1983-10-10 00:00:00',
      'station_id': stationIdController
    };

    await SoulApi().saveContact(data);

    setState(() {
      getData(widget.user.user!.id);
      isSavingContact = true;
      _nameController.text = '';
      _phoneController.text = '';
      _locationController.text = '';
    });
    Get.snackbar(
      "Saved successfully",
      "Contact has been saved successfully",
      backgroundColor: kPrimary,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }

  Future _neverSatisfied() async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            'Save New Contact',
            style: heading2,
          ),
          content: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const BackgroundImage(
                    image: 'assets/images/ft_church.jpg',
                  ),
                  TextInputFieldIcon(
                    icon: FontAwesomeIcons.user,
                    hint: 'Fullname',
                    controller: _nameController,
                    inputType: TextInputType.name,
                    textarea: false,
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  TextInputFieldIcon(
                    icon: FontAwesomeIcons.phone,
                    hint: 'Phone',
                    controller: _phoneController,
                    inputType: TextInputType.phone,
                    textarea: false,
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  TextInputFieldIcon(
                    icon: FontAwesomeIcons.mapPin,
                    hint: 'Location',
                    controller: _locationController,
                    inputType: TextInputType.streetAddress,
                    textarea: false,
                  ),
                ],
              ),
            ],
          )),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'CLOSE',
                style: TextStyle(color: kWhite),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'SAVE',
                style: TextStyle(color: kWhite),
              ),
              onPressed: () {
                if (_phoneController.text == '') {
                  return;
                }
                if (_nameController.text == '') {
                  return;
                }
                _saveNewContact();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future getData(id) async {
    var response = await SoulApi().getMyContact(id);
    setState(() {
      MyInvittees = response;
      loading = true;
    });
  }

  Future<void> call(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: loading == false
          ? Center(child: Loader())
          : MyInvittees == null || MyInvittees.data == null
              ? const Center(
                  child: Text(
                    'No Contact Found',
                    style: TextStyle(color: kPrimary),
                  ),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text(
                          'Soul Wining',
                          style: kBodyText,
                        ),
                        background: Image.asset(
                          'assets/images/soul_wining.jpg',
                          fit: BoxFit.fill,
                        ),
                        centerTitle: false,
                        stretchModes: const [
                          StretchMode.zoomBackground,
                          StretchMode.fadeTitle
                        ],
                      ),

                      expandedHeight: 250.0,
                      stretch: true,
                      pinned: true,
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // showSearch(
                            //     context: context,
                            //     delegate: SoulSearch(MyInvittees));
                          },
                        ),
                      ],
                      // flexibleSpace: FlexibleSpaceBar(
                      //   title: Text('Soul Winning', textScaler: 1),
                      //   background: Image.asset(
                      //     'assets/images/soul_wining.jpg',
                      //     fit: BoxFit.fill,
                      //   ),
                      //   stretchModes: <StretchMode>[StretchMode.zoomBackground],
                      // ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        final mySoul = MyInvittees.data![index];
                        return Slidable(
                          key: ValueKey(index),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Report',
                                onPressed: (BuildContext context) {
                                  Get.to(NewReportScreen(
                                    id: "${mySoul.id}",
                                    name:
                                        "${mySoul.surname} ${mySoul.firstname}",
                                    user: user,
                                  ));
                                },
                              ),
                              SlidableAction(
                                backgroundColor: const Color(0xFF21B7CA),
                                foregroundColor: Colors.white,
                                icon: Icons.call,
                                label: 'Call',
                                onPressed: (BuildContext context) {
                                  call("${mySoul.phone}");
                                },
                              ),
                            ],
                          ),
                          child: InkWell(
                            child: ListTile(
                              leading: Hero(
                                tag: "contact_${mySoul.id}",
                                child: CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    child: Text(
                                      mySoul.firstname![0].toUpperCase(),
                                      // name_to_avatar(
                                      //     "${mySoul.surname} ${mySoul.firstname}"),
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    )),
                              ),
                              title: Text(
                                "${mySoul.surname} ${mySoul.firstname}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle:
                                  Text("${mySoul.location} ${mySoul.phone}"),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ContactDetailScreen(
                                          "${mySoul.id}",
                                          "${mySoul.firstname} ${mySoul.surname}",
                                          "${mySoul.phone}"),
                                  settings: const RouteSettings(
                                      name: 'Soul Wininng View', arguments: []),
                                ),
                              );
                            },
                          ),
                        );
                      }, childCount: MyInvittees.data!.length),
                    ),
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_neverSatisfied()},
        child: const Icon(Icons.person_add, color: Colors.white),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
