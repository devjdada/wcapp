import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/api/UnitApi.dart';
import 'package:winners/api/UserApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/UnitSchema.dart';
import 'package:winners/screen/profile/ProfileScreen.dart';
import 'package:winners/shared/loader.dart';
import 'package:winners/shared/themes.dart';

class JoinUnitScreen extends StatefulWidget {
  const JoinUnitScreen({super.key});

  @override
  State<JoinUnitScreen> createState() => _JoinUnitScreenState();
}

class _JoinUnitScreenState extends State<JoinUnitScreen> {
  late UnitSchema units;
  late LogUserSchema logUser;
  bool loading = false;

  @override
  void initState() {
    getUnits();
    getLogUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Join Unit',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: loading == false
          ? Center(
              child: Loader(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: units.data!.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Card(
                    child: SizedBox(
                      height: height * 0.2,
                      width: width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              e.title.toString(),
                              style: heading2,
                            ),
                            Text(e.about.toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: e.leadership!.map((l) {
                                return Text(l.position.toString());
                              }).toList(),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: kPrimary,
                              ),
                              child: const Text('Join'),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "Join Unit",
                                  middleText:
                                      "Are you sure you want to join ${e.title} unit?",
                                  onConfirm: () => _joinUnit(e.id, e.stationId),
                                  onCancel: () => Get.back(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }

  getLogUser() async {
    var res = await UserApi().getLogUser();
    setState(() {
      logUser = res;
    });
  }

  getUnits() async {
    var res = await UnitApi().getUnit();
    setState(() {
      loading = true;
      units = res;
    });
  }

  Future<void> _joinUnit(int? id, int? stationId) async {
    var data = {
      "unit_id": id,
      "station_id": stationId,
      "user_id": logUser.user!.id
    };

    await UnitApi().joinUnit(data).then((value) {
      Get.to(ProfileScreen(logUser));
    });
  }
}
