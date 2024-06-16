import 'package:dio/dio.dart';
import 'package:winners/schema/StationBasicSchema.dart';
import 'package:winners/service/HttpService.dart';

class StationApi {
  getStationAndId() async {
    Response response = await HttpService().get('station-basic');
    return StationBasicSchema.fromJson(response.data);
  }
}
