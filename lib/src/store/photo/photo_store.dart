import 'package:mobile_app_demo/src/data/services/photo_service.dart';
import 'package:mobx/mobx.dart';

part 'photo_store.g.dart';

class PhotoStore = PhotoPrivate with _$PhotoStore;

abstract class PhotoPrivate with Store {
  final photoService = PhotoService();

  @observable
  bool isLoading = false;

  @action
  Future<void> getPhotos() async {
    await photoService.getPhotos();
  }
}
