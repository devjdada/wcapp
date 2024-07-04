import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/api/SoulApi.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/shared/data/AppString.dart';
import 'package:winners/shared/themes.dart';
import 'package:winners/shared/widget/RoundedButton.dart';
import 'package:winners/shared/widget/TextInputField.dart';

class NewReportScreen extends StatefulWidget {
  final String id;
  final String name;
  final LogUserSchema user;
  const NewReportScreen(
      {Key? key, required this.id, required this.name, required this.user})
      : super(key: key);

  @override
  State<NewReportScreen> createState() => _NewReportScreenState();
}

class _NewReportScreenState extends State<NewReportScreen> {
  bool _homecell = false;
  bool _baptised = false;
  bool _unit = false;
  bool _lastService = false;
  bool _foundationClass = false;
  bool _bornAgain = false;
  bool loading = false;

  _onChangedHomecell(bool value) => setState(() => _homecell = value);
  _onChangedBaptised(bool value) => setState(() => _baptised = value);
  _onChangedUnit(bool value) => setState(() => _unit = value);
  _onChangedLastService(bool value) => setState(() => _lastService = value);
  _onChangedFoundationClass(bool value) =>
      setState(() => _foundationClass = value);
  _onChangedBornAgain(bool value) => setState(() => _bornAgain = value);

  final _prayerController = TextEditingController();
  final _reportController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _saveContactReport() async {
    setState(() {
      loading = true;
    });

    var data = {
      'soul_id': widget.id,
      'station_id': widget.user.user!.stationId,
      'user_id': widget.user.user!.id!.toInt(),
      'report': _reportController.text,
      'prayer': _prayerController.text,
      'homecell': _homecell,
      'unit': _unit,
      'baptists': _baptised,
      'last_service': _lastService,
      'born_again': _bornAgain,
      'foundation_class': _foundationClass,
    };
    // print(data);
    await SoulApi().postReport(data);
    setState(() {
      loading = false;
      _reportController.text = '';
      _prayerController.text = '';
      _homecell = false;
      _lastService = false;
      _unit = false;
      _baptised = false;
      _bornAgain = false;
      _foundationClass = false;
    });
    // Get.snackbar(
    //   "Saved successfully",
    //   "Report has been saved successfully",
    //   backgroundColor: kPrimary,
    //   colorText: Colors.white,
    //   duration: const Duration(seconds: 5),
    // );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppString.soulReports),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        // drawer: Drawer(
        //   child: SideNav(),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kPrimary, Colors.greenAccent],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32, right: 32),
                    child: Text(
                      widget.name,
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextInputField(
                    hint: 'Report',
                    textarea: true,
                    controller: _reportController,
                    inputType: TextInputType.multiline,
                    inputAction: TextInputAction.done,
                  ),
                  TextInputField(
                    hint: 'Prayer Point',
                    textarea: true,
                    controller: _prayerController,
                    inputType: TextInputType.multiline,
                    inputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SwitchListTile(
                      value: _homecell,
                      onChanged: _onChangedHomecell,
                      title: const Text('Member of Homecell',
                          style: kBodyTextBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SwitchListTile(
                      value: _unit,
                      onChanged: _onChangedUnit,
                      title: const Text('Member of Service Unit',
                          style: kBodyTextBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SwitchListTile(
                      value: _baptised,
                      onChanged: _onChangedBaptised,
                      title: const Text('Baptised Water Immerson',
                          style: kBodyTextBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SwitchListTile(
                      value: _foundationClass,
                      onChanged: _onChangedFoundationClass,
                      title: const Text('Have Attended Foundation Class?',
                          style: kBodyTextBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SwitchListTile(
                      value: _bornAgain,
                      onChanged: _onChangedBornAgain,
                      title: const Text('Born Again?', style: kBodyTextBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SwitchListTile(
                      value: _lastService,
                      onChanged: _onChangedLastService,
                      title: const Text('Was in the Last Sunday Service?',
                          style: kBodyTextBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RoundedButton(
                    buttonName: 'Save Report',
                    callback: _saveContactReport,
                    loading: loading,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ));
  }
}
