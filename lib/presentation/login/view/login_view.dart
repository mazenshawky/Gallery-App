import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/presentation/resources/assets_manager.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/login_viewmodel.dart';
import '../../common/my_behavior.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final  _formKey = GlobalKey<FormState>();

  _bind(){
    _emailController.addListener(() => _viewModel.setEmail(_emailController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((isLoggedIn) {
      if(isLoggedIn){
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _appPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                _getBackground(size),
                _getForm(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBackground(Size size){
    return SizedBox(
      height: size.height,
      child: Image.asset(ImageAssets.loginBackground, fit: BoxFit.fitHeight),
    );
  }

  Widget _getForm(Size size){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .09),
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          SizedBox(height: size.width * .21),
          Text(
            AppStrings.myGallery,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: size.width * .08),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * .08),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: AppSize.s25, sigmaX: AppSize.s25),
                child: SizedBox(
                  width: size.width * .9,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.width * .12,
                            bottom: size.width * .02,
                          ),
                          child: Text(
                            AppStrings.logIn,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        SizedBox(height: size.width * .1),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * .08),
                          child: StreamBuilder<bool>(
                            stream: _viewModel.outIsEmailValid,
                            builder: (context, snapshot){
                              return TextFormField(
                                style: Theme.of(context).textTheme.bodyMedium,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: AppStrings.email,
                                  errorText: (snapshot.data ?? true) ? null : AppStrings.invalidEmail,
                                ),
                              );
                            },
                          ),

                        ),
                        SizedBox(height: size.width * .09),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * .08),
                          child: StreamBuilder<bool>(
                            stream: _viewModel.outIsPasswordValid,
                            builder: (context, snapshot){
                              return StreamBuilder<bool>(
                                stream: _viewModel.outIsPasswordVisible,
                                builder: (context, visibleSnapshot){
                                  return TextFormField(
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: (visibleSnapshot.data ?? true) ? true : false,
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      hintText: AppStrings.password,
                                      errorText: (snapshot.data ?? true) ? null : AppStrings.invalidPassword,
                                      suffixIcon: IconButton(
                                          onPressed: (){
                                            _viewModel.changePasswordVisibility((visibleSnapshot.data ?? true));
                                          },
                                          icon: (visibleSnapshot.data ?? true) ?
                                          Icon(Icons.visibility_off_outlined, color: ColorManager.grey,) :
                                          Icon(Icons.visibility_outlined, color: ColorManager.grey,)
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: size.width * .09),
                        StreamBuilder<bool>(
                            stream: _viewModel.outAreAllInputsValid,
                            builder: (context, snapshot) {
                              return SizedBox(
                                width: size.width * .66,
                                height: size.width * .11,
                                child: ElevatedButton(
                                  onPressed:
                                  (snapshot.data ?? false) ? (){
                                    _viewModel.login();
                                  } : null,
                                  child: const Text(
                                    AppStrings.submit,
                                  ),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}