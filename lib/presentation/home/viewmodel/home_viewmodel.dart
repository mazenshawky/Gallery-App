import 'dart:async';
import 'dart:io';

import 'package:gallery_app/presentation/common/freezed_data_classes.dart';

import '../../../app/app_prefs.dart';
import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../../domain/usecase/upload_usecase.dart';
import '../../common/toast.dart';

class UploadViewModel extends UploadViewModelInput with UploadViewModelOutput {

  final StreamController imageStreamController = StreamController<File>.broadcast();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  var uploadObject = UploadObject(File(""));

  final UploadUseCase _uploadUseCase;

  UploadViewModel(this._uploadUseCase);

  @override
  void start() {
    _appPreferences.getToken().then((value) {
      Constants.token = value;
      print(Constants.token);
    });
  }

  @override
  void dispose() {
    imageStreamController.close();
  }

  @override
  Sink get inputImage => imageStreamController.sink;

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
    });
  }


  @override
  setImage(File image) {
    inputImage.add(image);
    if (image.path.isNotEmpty) {
      // update register view object
      uploadObject = uploadObject.copyWith(image: image);
    } else {
      // reset image value in upload view object
      uploadObject = uploadObject.copyWith(image: image);
    }
  }
}

abstract class UploadViewModelInput {

  Sink get inputImage;

  upload();

  setImage(File image);
}

abstract class UploadViewModelOutput {

}
