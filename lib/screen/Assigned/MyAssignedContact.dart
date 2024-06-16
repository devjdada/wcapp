import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/MyAssignedSchema.dart';
import 'package:winners/screen/contact/ContactDetalScreen.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';

class MyAssignedContact extends StatefulWidget {
  final LogUserSchema user;
  MyAssignedContact({Key? key, required this.user}) : super(key: key);
  @override
  _MyAssignedContactState createState() => _MyAssignedContactState();
}

class _MyAssignedContactState extends State<MyAssignedContact> {
  // final AnalyticsService _analyticsService = AnalyticsService();
  late Map data;
  late List userData;
  late MyAssignedSchema myAssigned;

  bool isSavingContact = false;
  bool isInitUser = false;
  bool loading = false;

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
    getData(widget.user.user!.id);
    super.initState();
  }

  Future getData(id) async {
    var response = await SoulApi().getAssigned(id);

    setState(() {
      myAssigned = response;
      loading = true;
    });
  }

  void call(String number) => launch("tel:$number");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: loading == false
          ? Center(
              child: Loader(),
            )
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 250.0,
                  stretch: true,
                  pinned: true,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // showSearch(
                        //   context: context,
                        //   delegate: SoulSearch(myAssignedList),
                        // );
                      },
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('Assigned Contact'),
                    background: Image.asset(
                      'assets/images/assigned.jpg',
                      fit: BoxFit.fill,
                    ),
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final mySoul = myAssigned.data![index];
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
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         SoulReportScreen(
                              //           id: "${mySoul![index].id}",
                              //           name: "${mySoul[index].name} ",
                              //           user: widget.user,
                              //         )));
                            },
                          ),
                          SlidableAction(
                            backgroundColor: const Color(0xFF21B7CA),
                            foregroundColor: Colors.white,
                            icon: Icons.call,
                            label: 'Call',
                            onPressed: (BuildContext context) {
                              call("${mySoul.contact?.phone}");
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
                                "${mySoul.contact!.firstname![0]}${mySoul.contact!.surname![0]}",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          title: Text(
                            "${mySoul.contact!.surname} ${mySoul.contact!.firstname}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                              "${mySoul.contact!.location} ${mySoul.contact!.phone}"),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ContactDetailScreen(
                                      "${mySoul.id}",
                                      "${mySoul.contact!.surname} ${mySoul.contact!.firstname}",
                                      "${mySoul.contact!.phone}"),
                              settings: const RouteSettings(
                                  name: 'Soul Wininng View', arguments: []),
                            ),
                          );
                        },
                      ),
                    );
                  }, childCount: myAssigned.data!.length),
                )
              ],
            ),
    );
  }
}
