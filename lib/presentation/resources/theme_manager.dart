import 'package:flutter/material.dart';
import 'package:gallery_app/presentation/resources/font_manger.dart';
import 'package:gallery_app/presentation/resources/styles_manager.dart';
import 'package:gallery_app/presentation/resources/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(color: ColorManager.home1),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s18, color: ColorManager.white),
        primary: ColorManager.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s50, color: ColorManager.darkGrey),
      headlineMedium: getBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s30, color: ColorManager.darkGrey),
      headlineSmall: getBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s30, color: ColorManager.white),
      labelLarge: getSemiBoldStyle(fontFamily: FontConstants.balooThambi2FontFamily, fontSize: FontSize.s32, color: ColorManager.darkGrey),
      labelMedium: getSemiBoldStyle(fontFamily: FontConstants.balooThambi2FontFamily, fontSize: FontSize.s20, color: ColorManager.darkGrey),
      bodyLarge: getBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s27, color: ColorManager.darkGrey),
      bodyMedium: getSemiBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s16, color: ColorManager.darkGrey),
    ),

    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      contentPadding: const EdgeInsets.only(top: AppPadding.p8, bottom: AppPadding.p8, left: AppPadding.p20),
      hintStyle: getSemiBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s16, color: ColorManager.grey),
      errorStyle: getSemiBoldStyle(fontFamily: FontConstants.balooThambi2FontFamily, color: ColorManager.red),

      // enabled border style
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s22)),
      ),

      // focused border style
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s22)),
      ),

      // error border style
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s22)),
      ),

      // focused error border style
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s22)),
      ),
    ),
  );
}