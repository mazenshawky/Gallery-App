import '../../app/constants.dart';
import '../../domain/model/models.dart';
import '../response/responses.dart';
import 'package:gallery_app/app/extensions.dart';

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return User(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.emailVerifiedAt.orEmpty() ?? Constants.empty,
        this?.createdAt.orEmpty() ?? Constants.empty,
        this?.updatedAt.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.user.toDomain(), this?.token.orEmpty() ?? Constants.empty);
  }
}

extension UploadResponseMapper on UploadResponse? {
  Image toDomain() {
    List<dynamic> data = (this?.data?.map((e) => e.orEmpty() ?? Constants.empty) ?? const Iterable.empty()).cast<dynamic>().toList();
    return Image(
        this?.status.orEmpty() ?? Constants.empty,
        data,
        this?.message.orEmpty() ?? Constants.empty
    );
  }
}