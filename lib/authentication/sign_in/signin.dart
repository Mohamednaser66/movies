import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_provider.dart';
import '../widget/custom_divider.dart';
import '../widget/custom_text_button.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 19),
          child: ChangeNotifierProvider(
            create: (context) => AppProvider(),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 19),
              child: Column(
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
                      title: 'Email', preffixIcon: Icons.email_sharp),
                  SizedBox(
                    height: 22.h,
                  ),
                  Consumer<AppProvider>(
                    builder: (BuildContext context, AppProvider value,
                        Widget? child) {
                      return CustomTextFormFiled(
                        title: 'Password',
                        preffixIcon: Icons.lock,
                        suffixIcon: value.isSecure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onClick: value.clickPassword,
                        isSecure: value.isSecure,
                      );
                    },
                  ),
                  SizedBox(height: 12.h,),
                  Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                          onClick: () {
                            Navigator.pushNamed(context, RoutesManger.resrtPassword);
                          }, title: 'Forget Password ?')),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomElvatedButton(title: 'login', onClick: () {}),
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
                      CustomTextButton(onClick: () {
                        Navigator.pushNamed(context, RoutesManger.signUp);
                      }, title: 'Create One'),
                    ],
                  ),
                  SizedBox(height: 27.h,),
                  CustomDivider(),
                  SizedBox(
                    height: 28.h,
                  ),
                  CustomElvatedButton(
                      image: svgManger.google,
                      title: 'Login With Google',
                      onClick: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
