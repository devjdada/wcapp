import 'package:winners/schema/HomecellsSchema.dart';
import 'package:winners/service/HttpService.dart';

class HomecellApi {
  getHomecells(station) async {
    var res = await HttpService().get('station-homecell/$station');
    return HomecellsSchema.fromJson(res.data);
  }

  joinHomecell(data) async {
    await HttpService().post('wsf-member', data: data);
    return true;
  }
}
