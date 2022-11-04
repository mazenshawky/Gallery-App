import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';
import '../response/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/auth/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST("/upload")
  Future<UploadResponse> uploadImage(
      @Part(name: "img") File image);

  @GET("/my-gallery")
  Future<GalleryResponse> getGallery();
}
