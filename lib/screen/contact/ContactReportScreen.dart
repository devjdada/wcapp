import 'package:flutter/material.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/MyContactReportSchema.dart';
import 'package:winners/screen/contact/ContactDetalScreen.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/themes.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Report', style: kBodyText),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                                r.soul!.firstname![0].toUpperCase(),
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
                        style: const TextStyle(
                            color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    if (r.prayer != null)
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 3.0, left: 15.0, right: 15.0),
                        child: Text(
                          r.prayer.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, top: 4, left: 15, right: 15),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Has Attended Our Service | "),
                                  r.lastService == 0
                                      ? const Text(
                                          "NO",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(
                                          "YES",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Baptist in water immersion | "),
                                  r.baptised == 0
                                      ? const Text(
                                          "NO",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(
                                          "YES",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Born Again | "),
                                  r.bornAgain == 0
                                      ? const Text(
                                          "NO",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(
                                          "YES",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Has join the homecell | "),
                                  r.homecell == 0
                                      ? const Text(
                                          "NO",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(
                                          "YES",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                      "Has  join any of  the service unit | "),
                                  r.unit == 0
                                      ? const Text(
                                          "NO",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                      : const Text(
                                          "YES",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )
                                ],
                              ),
                            ],
                          ),
                        ],
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
