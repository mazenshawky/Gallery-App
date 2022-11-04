import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:gallery_app/domain/model/models.dart';
import 'package:gallery_app/presentation/common/freezed_data_classes.dart';

import '../../../domain/usecase/gallery_usecase.dart';
import '../../../domain/usecase/upload_usecase.dart';
import '../../common/toast.dart';

class UploadViewModel extends UploadViewModelInput with UploadViewModelOutput {

  final StreamController _galleryStreamController = StreamController<Gallery>.broadcast();

  final StreamController isImageUploadedSuccessfullyStreamController = StreamController<bool>.broadcast();

  var uploadObject = UploadObject(File(""));

  final UploadUseCase _uploadUseCase;

  final GalleryUseCase _galleryUseCase;

  UploadViewModel(this._uploadUseCase, this._galleryUseCase);

  void start() {
    getGallery();
  }

  void dispose() {
    _galleryStreamController.close();
    isImageUploadedSuccessfullyStreamController.close();
  }

  getGallery() async{
    (await _galleryUseCase.execute(Void))
        .fold(
            (failure) => {
            showToast(text: failure.errorMessage)
        }, (data) {
      inputGallery.add(data);
    });
  }

  @override
  Sink get inputGallery => _galleryStreamController.sink;

  @override
  Stream<Gallery> get outputGallery => _galleryStreamController.stream.map((data) => data);

  @override
  upload() async {
    (await _uploadUseCase.execute(UploadUseCaseInput(
      uploadObject.image,
    )))
        .fold(
            (failure) => {
              showToast(text: failure.errorMessage)
        }, (data) {
      showToast(text: data.message);
      isImageUploadedSuccessfullyStreamController.add(true);
    });
  }

  @override
  setImage(File image) {
    uploadObject = uploadObject.copyWith(image: image);
  }
}

abstract class UploadViewModelInput {
  upload();

  setImage(File image);

  Sink get inputGallery;
}

abstract class UploadViewModelOutput {
  Stream<Gallery> get outputGallery;
}
