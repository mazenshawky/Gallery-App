class User{
  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;

  User(this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt);
}

class Authentication{
  User? user;
  String token;

  Authentication(this.user, this.token);
}

class ImageObject{
  String status;
  List<dynamic> data;
  String message;

  ImageObject(this.status, this.data, this.message);
}

class Data{
  List<String> images;

  Data(this.images);
}

class Gallery{
  String status;
  Data? data;
  String message;

  Gallery(this.status, this.data, this.message);
}