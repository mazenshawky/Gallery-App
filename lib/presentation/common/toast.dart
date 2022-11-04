import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_app/app/constants.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

void showToast({
  required String text,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: Constants.two,
      backgroundColor: ColorManager.primary,
      textColor: ColorManager.darkGrey,
      fontSize: AppSize.s15,
    );