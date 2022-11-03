import 'package:flutter/material.dart';
import 'package:gallery_app/presentation/resources/font_manger.dart';
import 'package:gallery_app/presentation/resources/styles_manager.dart';
import 'package:gallery_app/presentation/resources/values_manager.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
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
    //   labelLarge: getSemiBoldStyle(fontSize: FontSize.s24, color: ColorManager.black),
    //   labelMedium: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.black),
    //   labelSmall: getSemiBoldStyle(fontSize: FontSize.s14, color: ColorManager.primary),
    //   titleMedium: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.lightWhite),
    //   titleLarge: getSemiBoldStyle(fontSize: FontSize.s16, color: ColorManager.primary),
    //   titleSmall: getMediumStyle(fontSize: FontSize.s16, color: ColorManager.grey),
    //   bodyLarge: getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.darkGrey),
      bodyMedium: getSemiBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s16, color: ColorManager.darkGrey),
    //   bodySmall: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.black),
    //   displayLarge: getBoldStyle(fontSize: FontSize.s20, color: ColorManager.black),
    //   displayMedium: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.primary),
    //   displaySmall: getMediumStyle(fontSize: FontSize.s14, color: ColorManager.grey),
    ),

    // input decoration theme(text form field)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      contentPadding: const EdgeInsets.only(top: AppPadding.p8, bottom: AppPadding.p8, left: AppPadding.p20),
      hintStyle: getSemiBoldStyle(fontFamily: FontConstants.segoeUIFontFamily, fontSize: FontSize.s16, color: ColorManager.grey),
      errorStyle: getSemiBoldStyle(fontFamily: FontConstants.balooThambi2FontFamily, color: ColorManager.error),

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