import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../model/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, ImageObject>> uploadImage(UploadRequest uploadRequest);

  Future<Either<Failure, Gallery>> getGallery();
}