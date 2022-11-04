import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject{
  factory LoginObject(String email, String password) = _LoginObject;
}

@freezed
class UploadObject with _$UploadObject{
  factory UploadObject(File image) = _UploadObject;
}