import 'package:winners/schema/ContactDetailSchema.dart';
import 'package:winners/schema/MyAssignedSchema.dart';
import 'package:winners/schema/MyContactReportSchema.dart';
import 'package:winners/schema/MyContactSchema.dart';
import 'package:winners/service/HttpService.dart';

class SoulApi {
  getMyContact(id) async {
    var response = await HttpService().get('my-contact/$id');
    return MyContactSchema.fromJson(response.data);
  }

  saveContact(data) async {
    await HttpService().post('soul', data: data);
    return true;
  }

  getAssigned(id) async {
    var response = await HttpService().get('my-assigned/$id');
    return MyAssignedSchema.fromJson(response.data);
  }

  getReport(id) async {
    var response = await HttpService().get('my-contact-report/$id');
    return MyContactReportSchema.fromJson(response.data);
  }

  getContact(id) async {
    var response = await HttpService().get('soul/$id');
    return ContactDetailSchema.fromJson(response.data);
  }

  postReport(data) async {
    await HttpService().post('soul-report', data: data);
    return true;
  }
}
