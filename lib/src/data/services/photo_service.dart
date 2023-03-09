import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_demo/src/data/services/generic_service.dart';

class PhotoService {
  final path = dotenv.env['BASE_URL'].toString();

  Future<List<dynamic>?> getPhotos() async {
    try {
      final resp = await GenericService.instance.get(
        path,
        headers: {},
        queryParams: {},
      );
      return resp.data as List<dynamic>;
    } catch (e) {
      return null;
    }
  }
}
