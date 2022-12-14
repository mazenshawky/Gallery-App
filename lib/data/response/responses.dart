import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  UserResponse(this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt);

  // from json
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse {
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "token")
  String? token;

  AuthenticationResponse(this.user, this.token);

  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class UploadResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  List<dynamic>? data;
  @JsonKey(name: "message")
  String? message;

  UploadResponse(this.status, this.data, this.message);

  // from json
  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: "images")
  List<String>? images;

  DataResponse(this.images);

  // from json
  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class GalleryResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "data")
  DataResponse? data;
  @JsonKey(name: "message")
  String? message;

  GalleryResponse(this.status, this.data, this.message);

  // from json
  factory GalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$GalleryResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$GalleryResponseToJson(this);
}