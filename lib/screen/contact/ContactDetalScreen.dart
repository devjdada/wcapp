// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/schema/ContactDetailSchema.dart';
import 'package:winners/screen/contact/include/SoulDetailAssigned.dart';
import 'package:winners/screen/contact/include/SoulDetailReport.dart';
import 'package:winners/shared/loader.dart';
import 'package:winners/shared/themes.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen(this.id, this.name, this.phone);

  final String id;
  final String name;
  final String phone;
  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen>
    with TickerProviderStateMixin {
  bool loadingContact = false;
  late List<Tab> _tabs;
  late List<Widget> _pages;
  late TabController _controller;
  late ContactDetailSchema contacts;

  @override
  void initState() {
    getContact();
    super.initState();
  }

  getContact() async {
    var contact = await SoulApi().getContact(widget.id);

    setState(() {
      contacts = contact;
      loadingContact = true;
    });
    initTab();
  }

  initTab() {
    _tabs = [
      Tab(
        child: Text('Assigned', style: TextStyle(color: primary)),
      ),
      Tab(
        child: Text('Report', style: TextStyle(color: primary)),
      ),
    ];
    _pages = [
      contacts.assigned!.isNotEmpty
          ? SoulDetailAssigned(contacts)
          : Center(
              child:
                  Text('No Follop Memeber', style: TextStyle(color: primary)),
            ),

      contacts.report!.isNotEmpty
          ? SoulDetailReport(contacts)
          : Center(
              child: Text('No report', style: TextStyle(color: primary)),
            ),

      //SoulProfileAssigned(assigned)
      // SoulReportWidget(invittes),
    ];
    _controller = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kPrimary,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Stack(
              children: [
                Hero(
                  tag: 'contact_${widget.id}',
                  child: CircleAvatar(
                      minRadius: 40,
                      backgroundColor: primary,
                      child: Text(
                        widget.name[0].toString().toUpperCase(),
                        style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              Text(
                widget.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(height: 6),
              Text(
                widget.phone.toString(),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  onPrimary: Colors.white,
                  primary: Colors.deepPurpleAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                ),
                child: const Text('Call'),
                onPressed: () {},
              ),
              const SizedBox(height: 24, child: VerticalDivider()),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  onPrimary: Colors.white,
                  primary: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                ),
                child: const Text('sms'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 30),
          loadingContact == false
              ? Center(
                  child: Loader(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildSta(context, contacts.report!.length, "Report"),
                    const SizedBox(height: 24, child: VerticalDivider()),
                    MaterialButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                              radius: 24,
                              backgroundColor: primary,
                              child: Text(
                                contacts.soul!.winner!.name![0]
                                    .toString()
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                          const SizedBox(height: 6),
                          Text(
                            "${contacts.soul!.winner!.name}",
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24, child: VerticalDivider()),
                    buildSta(context, contacts.assigned!.length, "Assigned"),
                  ],
                ),
          const SizedBox(height: 24),
          loadingContact == false
              ? Container()
              : Column(
                  children: [
                    TabBar(
                      controller: _controller,
                      tabs: _tabs,
                      indicatorColor: primary,
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(500.0),
                      child: TabBarView(
                        controller: _controller,
                        children: _pages,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  buildSta(BuildContext context, int i, String s) {
    return MaterialButton(
      onPressed: () {},
      child: Column(
        children: <Widget>[
          Text(
            i.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 6),
          Text(
            s,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
