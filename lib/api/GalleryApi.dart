import 'package:dio/dio.dart';
import 'package:winners/schema/GallerySchema.dart';
import 'package:winners/service/HttpService.dart';

class GalleryApi {
  getGallery() async {
    Response response = await HttpService().get('gallery');
    return GallerySchema.fromJson(response.data);
  }
}
