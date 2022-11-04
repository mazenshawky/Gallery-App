import 'package:gallery_app/data/network/app_api.dart';
import 'package:gallery_app/data/network/requests.dart';
import 'package:gallery_app/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<UploadResponse> uploadImage(UploadRequest uploadRequest);

  Future<GalleryResponse> getGallery();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

  @override
  Future<UploadResponse> uploadImage(UploadRequest uploadRequest) async {
    return await _appServiceClient.uploadImage(uploadRequest.image);
  }

  @override
  Future<GalleryResponse> getGallery() async {
    return await _appServiceClient.getGallery();
  }
}
