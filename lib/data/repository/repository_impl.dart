import 'package:gallery_app/data/data_source/remote_data_source.dart';
import 'package:gallery_app/data/mapper/mapper.dart';
import 'package:gallery_app/data/network/failure.dart';
import 'package:gallery_app/data/network/network_info.dart';

import 'package:gallery_app/data/network/requests.dart';

import 'package:gallery_app/domain/model/models.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';
import '../../presentation/resources/strings_manager.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.token != null) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(AppStrings.loginError));
        }
      } catch (error) {
        return Left(Failure(AppStrings.defaultError));
      }
    } else {
      return Left(Failure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, Image>> uploadImage(
      UploadRequest uploadRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.uploadImage(uploadRequest);

        if (response.status != null) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(AppStrings.uploadError));
        }
      } catch (error) {
        return Left(Failure(AppStrings.defaultError));
      }
    } else {
      return Left(Failure(AppStrings.noInternetError));
    }
  }
}