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

class Image{
  String status;
  List<dynamic> data;
  String message;

  Image(this.status, this.data, this.message);
}