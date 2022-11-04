import 'dart:io';

class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class UploadRequest {
  File image;

  UploadRequest(this.image);
}