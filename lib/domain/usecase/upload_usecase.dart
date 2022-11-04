import 'dart:io';

import 'package:gallery_app/data/network/requests.dart';
import 'package:gallery_app/domain/model/models.dart';
import 'package:gallery_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class UploadUseCase implements BaseUseCase<UploadUseCaseInput, ImageObject> {
  final Repository _repository;

  UploadUseCase(this._repository);

  @override
  Future<Either<Failure, ImageObject>> execute(
      UploadUseCaseInput input) async {
    return await _repository.uploadImage(UploadRequest(input.image));
  }
}

class UploadUseCaseInput {
  File image;

  UploadUseCaseInput(this.image);
}
