import 'package:mobile_app_demo/src/data/services/photo_service.dart';
import 'package:mobile_app_demo/src/models/photo_model.dart';
import 'package:mobx/mobx.dart';

part 'photo_store.g.dart';

class PhotoStore = PhotoPrivate with _$PhotoStore;

abstract class PhotoPrivate with Store {
  final photoService = PhotoService();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<PhotoModel> photos = ObservableList();

  @observable
  ObservableList<PhotoModel> selectedPhotos = ObservableList();

  @observable
  PhotoModel selectedPhotoDetail = PhotoModel();

  @action
  Future<void> getPhotos() async {
    isLoading = true;
    final resp = await photoService.getPhotos();
    for (var element in resp!) {
      photos.add(PhotoModel.fromJson(element as Map<String, dynamic>));
    }
    isLoading = false;
  }

  Future<void> starPhoto({required PhotoModel photo}) async {
    photo.isSelected = !photo.isSelected;
    if (selectedPhotos.contains(photo)) {
      selectedPhotos.remove(photo);
    } else {
      selectedPhotos.add(photo);
    }
  }

  void clearSelectedPhotos() {
    for (var element in selectedPhotos) {
      element.isSelected = false;
    }
    selectedPhotos.clear();
  }

  void selectPhotoDetail(PhotoModel photoModel) =>
      selectedPhotoDetail = photoModel;
}
