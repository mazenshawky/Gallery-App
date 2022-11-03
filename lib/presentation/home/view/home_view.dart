import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery_app/presentation/resources/assets_manager.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../login/view/my_behavior.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.home1,
      body: Stack(
        children: [
          Image.asset(ImageAssets.homeBackground, color: ColorManager.home2, width: size.width, height: size.height),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * .017, right: size.width * .07),
              child: Container(
                width: size.width * .18,
                height: size.width * .18,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.width * .08),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.profile),
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * .07, right: size.width * .07, top: size.height * .05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcomeMina,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(height: size.height * .04),
                Padding(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: size.height * .047,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(size.width * .04),
                          ),
                          child: InkWell(
                            onTap: (){
                              _logout();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * .037),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: ColorManager.red,
                                            spreadRadius: size.width * - .025,
                                            blurRadius: size.width * .03,
                                            offset: Offset(size.width * - .025, AppSize.s0),
                                        ),
                                      ],
                                    ),
                                    child: SvgPicture.asset(ImageAssets.logout),),
                                  SizedBox(width: size.width * .037),
                                  Text(
                                    AppStrings.logOut,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * .06),
                      Expanded(
                        child: Container(
                          height: size.height * .047,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(size.width * .04),
                          ),
                          child: InkWell(
                            onTap: (){
                              dismissDialog(context);
                              showPopup(context, size);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * .037),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.red,
                                          spreadRadius: size.width * - .025,
                                          blurRadius: size.width * .03,
                                          offset: Offset(size.width * - .025, AppSize.s0),
                                        ),
                                      ],
                                    ),
                                    child: SvgPicture.asset(ImageAssets.upload),),
                                  SizedBox(width: size.width * .037),
                                  Text(
                                    AppStrings.upload,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .012),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: size.width * .05,
                        crossAxisSpacing: size.width * .05,
                        children: List.generate(
                          21,
                              (index) => buildGridProduct(size),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildGridProduct(Size size) => Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * .05),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImageAssets.gallery),
        )
    ),
  );

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(
      BuildContext context, size) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .08),
          side: BorderSide(
            color: ColorManager.white,
          ),
        ),
        elevation: AppSize.s0,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size.width * .08),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: AppSize.s10, sigmaX: AppSize.s10),
            child: SizedBox(
              width: size.width * .8,
              height: size.height * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: size.width * .47,
                      height: size.height * .07,
                      decoration: BoxDecoration(
                        color: ColorManager.lightPurple,
                        borderRadius: BorderRadius.circular(size.width * .05),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * .05),
                        child: Row(
                          children: [
                            Image.asset(ImageAssets.gallery),
                            SizedBox(width: size.width * .03),
                            Text(
                              AppStrings.gallery,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * .05),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: size.width * .47,
                      height: size.height * .07,
                      decoration: BoxDecoration(
                        color: ColorManager.lightBlue,
                        borderRadius: BorderRadius.circular(size.width * .05),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * .025),
                        child: Row(
                          children: [
                            Image.asset(ImageAssets.camera),
                            Text(
                              AppStrings.camera,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  _logout(){
    _appPreferences.logout();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
