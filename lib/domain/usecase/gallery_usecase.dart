import 'package:gallery_app/data/network/requests.dart';
import 'package:gallery_app/domain/model/models.dart';
import 'package:gallery_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class GalleryUseCase implements BaseUseCase<void, Gallery> {
  final Repository _repository;

  GalleryUseCase(this._repository);

  @override
  Future<Either<Failure, Gallery>> execute(void input) async {
    return await _repository.getGallery();
  }
}