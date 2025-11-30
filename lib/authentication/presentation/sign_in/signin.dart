import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/authentication/data/models/LoginRequest.dart';
import 'package:movie/authentication/presentation/Auth_view_model/auth_cubit.dart';
import 'package:movie/core/app_validatores.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/di/di.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';
import 'package:movie/dialog/dialog.dart';

import '../widget/custom_divider.dart';
import '../widget/custom_text_button.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController emailController;
  late TextEditingController passWordController;
  bool isSecure = true;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passWordController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {


      final token = await context.read<AuthCubit>().getToken();
      if (token != null && token.isNotEmpty) {
        log("token==$token");
        Navigator.pushReplacementNamed(context, RoutesManger.mainLayout);
      }
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passWordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 19),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 19),
            child: Column(
              key: formKey,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 67.h,
                ),
                Center(
                  child: Image.asset(
                    ImagesManger.signInLogo,
                  ),
                ),
                SizedBox(
                  height: 69.h,
                ),
                CustomTextFormFiled(
                  validation: (value) => AppValidators.validateEmail(value),
                    controller: emailController,
                    title: 'Email',
                    prefixIcon:Icon( Icons.email_sharp)),
                SizedBox(
                  height: 22.h,
                ),
                CustomTextFormFiled(
                  validation: (value) => AppValidators.validatePassword(value),
                  controller: passWordController,
                  title: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon:
                      isSecure ? Icons.visibility_off : Icons.visibility,
                  onClick: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                  isSecure: isSecure,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextButton(
                        onClick: () {
                          Navigator.pushNamed(
                              context, RoutesManger.resetPassword);
                        },
                        title: 'Forget Password ?')),
                SizedBox(
                  height: 20.h,
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      Dialogs.showLoadingDialog(context, 'wait...');
                    }
                    if (state is LoginError) {
                      Dialogs.showMessageDialog(context,
                          message: state.message);
                    }
                    if (state is LoginSuccess) {
                      Dialogs.hideDialog(context);
                      Navigator.pushReplacementNamed(
                          context, RoutesManger.mainLayout);
                    }
                  },
                  child: CustomElevatedButton(
                      title: 'login',
                      onClick: () {
                        if(!formKey.currentState!.validate()){
                          return;
                        }
                        context.read<AuthCubit>().login(LoginRequest(
                            email: emailController.text,
                            password: passWordController.text));
                      }),
                ),
                SizedBox(
                  height: 33.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t Have Account ?',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    CustomTextButton(
                        onClick: () {
                          Navigator.pushNamed(context, RoutesManger.signUp);
                        },
                        title: 'Create One'),
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                CustomDivider(),
                SizedBox(
                  height: 28.h,
                ),
                CustomElevatedButton(
                    image: SvgManger.google,
                    title: 'Login With Google',
                    onClick: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
