// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winners/api/HomecellApi.dart';
import 'package:winners/schema/HomecellsSchema.dart';
import 'package:winners/search/HomecellSearch.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';
import 'package:winners/shared/openDrawer.dart';
import 'package:winners/shared/themes.dart';

class HomecellScreen extends StatefulWidget {
  const HomecellScreen(this.station, {Key? key}) : super(key: key);
  final String station;

  @override
  _HomecellScreenState createState() => _HomecellScreenState();
}

class _HomecellScreenState extends State<HomecellScreen> {
  late Future<HomecellsSchema?> homecellsFuture;

  @override
  void initState() {
    super.initState();
    homecellsFuture = fetchData();
  }

  Future<HomecellsSchema?> fetchData() async {
    try {
      var homecells = await HomecellApi().getHomecells(widget.station);
      return homecells;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      drawer: const Drawer(child: AppDrawer()),
      body: FutureBuilder<HomecellsSchema?>(
        future: homecellsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loader());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data == null) {
            return const Center(child: Text('No data found'));
          } else {
            var homecells = snapshot.data!;
            return CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 250.0,
                  stretch: true,
                  pinned: true,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: HomecellSearch(homecells),
                        );
                      },
                    ),
                  ],
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  leading: const OpenDrawer(),
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text(
                      'Homecells',
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    background: Image.asset(
                      'assets/images/wsf.png',
                      fit: BoxFit.fill,
                    ),
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground,
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(2.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final hc = homecells.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 2, right: 10, left: 10),
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  hc.title.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  hc.address.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: hc.leaders!.map(
                                    (e) {
                                      return InkWell(
                                        onTap: () async {
                                          // Handle leader tap
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          child: Text(
                                            e.position
                                                .toString()
                                                .substring(0, 1),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimary,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: homecells.data!.length,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> call(String number) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: number,
    );
    await launchUrl(launchUri);
  }

  Future<void> sendSms(String number) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: number,
    );
    await launchUrl(launchUri);
  }

  Future<void> sendEmail(String number) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: number,
    );
    await launchUrl(launchUri);
  }
}
