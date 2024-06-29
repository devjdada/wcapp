import 'package:dio/dio.dart';
import 'package:winners/schema/UnitSchema.dart';
import 'package:winners/service/HttpService.dart';

class UnitApi {
  getUnit() async {
    Response response = await HttpService().get('unit');
    return UnitSchema.fromJson(response.data);
  }

  joinUnit(data) async {
    await HttpService().post('unit-member', data: data);
    return true;
  }
}
