// File path: lib/screens/MyAssignedContact.dart

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/MyAssignedSchema.dart';
import 'package:winners/screen/contact/ContactDetalScreen.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';
import 'package:winners/shared/themes.dart';

class MyAssignedContact extends StatefulWidget {
  final LogUserSchema user;
  MyAssignedContact({Key? key, required this.user}) : super(key: key);

  @override
  _MyAssignedContactState createState() => _MyAssignedContactState();
}

class _MyAssignedContactState extends State<MyAssignedContact> {
  late MyAssignedSchema? myAssigned;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData("${widget.user.user!.id}");
  }

  Future<void> getData(String id) async {
    try {
      var response = await SoulApi().getAssigned(id);
      setState(() {
        myAssigned = response;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
        myAssigned = null; // Handle error state
      });
      // Handle error: show a dialog, snack bar, or log the error
    }
  }

  void call(String number) => launch("tel:$number");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: loading
          ? Center(
              child: Loader(),
            )
          : myAssigned == null || myAssigned!.data == null
              ? const Center(
                  child: Text('No data available.'),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 250.0,
                      stretch: true,
                      pinned: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // Uncomment and implement search functionality
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
                                  // Uncomment and implement report functionality
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
                                  // call("${mySoul.contact?.phone}");
                                },
                              ),
                            ],
                          ),
                          child: InkWell(
                            child: ListTile(
                              leading: Hero(
                                tag: "contact_${myAssigned!.data![index].id}",
                                child: CircleAvatar(
                                  backgroundColor: primary,
                                  child: Text(
                                    myAssigned!
                                        .data![index].contact!.firstname![0]
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              title: const Text(
                                "Surnmae and Last name",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: const Text("Location Phone"),
                            ),
                            onTap: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         ContactDetailScreen(
                              //             "${mySoul.id}",
                              //             "${mySoul.contact?.surname} ${mySoul.contact!.firstname}",
                              //             "${mySoul.contact!.phone}"),
                              //     settings: const RouteSettings(
                              //         name: 'Soul Wininng View', arguments: []),
                              //   ),
                              // );
                            },
                          ),
                        );
                      }, childCount: myAssigned!.data!.length),
                    )
                  ],
                ),
    );
  }
}
