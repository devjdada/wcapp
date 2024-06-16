import 'package:flutter/material.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/MyContactReportSchema.dart';
import 'package:winners/screen/contact/ContactDetalScreen.dart';
import 'package:winners/shared/AppDrawer.dart';

class ContactReportScreen extends StatefulWidget {
  const ContactReportScreen(this.me, {super.key});
  final LogUserSchema me;

  @override
  State<ContactReportScreen> createState() => _ContactReportScreenState();
}

class _ContactReportScreenState extends State<ContactReportScreen> {
  late Future<MyContactReportSchema> reports;

  @override
  void initState() {
    super.initState();
    reports = getContactReport(widget.me.user!.id);
  }

  Future<MyContactReportSchema> getContactReport(id) async {
    return await SoulApi().getReport(id);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Report'),
        backgroundColor: Colors.blue,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder<MyContactReportSchema>(
        future: reports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
            return const Center(child: Text('No reports found.'));
          }

          final reportData = snapshot.data!.data;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reportData!.map((r) {
                return Column(
                  children: [
                    InkWell(
                      child: ListTile(
                        leading: Hero(
                          tag: "contact_${r.soul!.id}",
                          child: CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              child: Text(
                                "${r.soul!.firstname![0].toUpperCase()}",
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                        title: Text(
                          "${r.soul!.surname} ${r.soul!.firstname}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text("${r.soul!.location} ${r.soul!.phone}"),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ContactDetailScreen(
                                    "${r.soul!.id}",
                                    "${r.soul!.firstname} ${r.soul!.surname}",
                                    "${r.soul!..phone}"),
                            settings: const RouteSettings(
                                name: 'Soul Wininng View', arguments: []),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 3.0, left: 15.0, right: 15.0),
                      child: Text(
                        r.report.toString(),
                        style: textTheme.bodyText2!
                            .copyWith(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    if (r.prayer != null)
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 3.0, left: 15.0, right: 15.0),
                        child: Text(
                          r.prayer.toString(),
                          style: textTheme.bodyText2!
                              .copyWith(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            if (r.baptised != null)
                              Chip(
                                elevation: 20,
                                padding: const EdgeInsets.all(5),
                                backgroundColor: Colors.blueAccent[100],
                                shadowColor: Colors.black,
                                label: const Text(
                                  "Baptised",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            if (r.bornAgain != null)
                              Chip(
                                elevation: 20,
                                padding: const EdgeInsets.all(5),
                                backgroundColor: Colors.greenAccent[100],
                                shadowColor: Colors.black,
                                label: const Text(
                                  "Born Again",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            if (r.foundationClass != null)
                              Chip(
                                elevation: 20,
                                padding: const EdgeInsets.all(5),
                                backgroundColor: Colors.brown[100],
                                shadowColor: Colors.black,
                                label: const Text(
                                  "Foundation Class",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            if (r.homecell != null)
                              Chip(
                                elevation: 20,
                                padding: const EdgeInsets.all(5),
                                backgroundColor: Colors.pinkAccent[100],
                                shadowColor: Colors.black,
                                label: const Text(
                                  "Joined WSF",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            if (r.unit != null)
                              Chip(
                                elevation: 20,
                                padding: const EdgeInsets.all(5),
                                backgroundColor: Colors.deepPurpleAccent[100],
                                shadowColor: Colors.black,
                                label: const Text(
                                  "Joined Unit",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
