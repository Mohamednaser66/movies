import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_provider.dart';
import '../widget/custom_text_button.dart';
import 'data/user_regester_request.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController controllerName;

  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  late TextEditingController controllerConfirmPassword;
  late TextEditingController controllerPhone;

  late AppProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerConfirmPassword = TextEditingController();
    controllerPhone = TextEditingController();
    provider = AppProvider();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPhone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Register'),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: ChangeNotifierProvider.value(
          value: provider,
          child: Consumer<AppProvider>(
            builder: (context, myProvider, child) {
              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 120.h,
                    ),
                    CustomTextFormFiled(
                        controller: controllerName,
                        title: 'Name',
                        preffixIcon: Icons.account_box_rounded),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormFiled(
                        controller: controllerEmail,
                        title: 'Email',
                        preffixIcon: Icons.email_sharp),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormFiled(
                      controller: controllerPassword,
                      title: 'Password',
                      preffixIcon: Icons.lock,
                      onClick: myProvider.clickPassword,
                      isSecure: myProvider.isSecure,
                      suffixIcon: myProvider.isSecure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormFiled(
                      controller: controllerConfirmPassword,
                      title: 'ConfirmPassword',
                      preffixIcon: Icons.lock,
                      onClick: myProvider.clickConfirmPassword,
                      isSecure: myProvider.confirmPassword,
                      suffixIcon: myProvider.confirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormFiled(
                      controller: controllerPhone,
                      title: 'phone',
                      preffixIcon: Icons.phone,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomElvatedButton(
                        title: 'Create Account', onClick: _onClick),
                    SizedBox(
                      height: 17.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already Have Account?',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        CustomTextButton(
                          title: 'login',
                          onClick: () {
                            Navigator.pushNamed(context, RoutesManger.signIn);
                          },
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onClick() async {
    UserRegesterRequest request = UserRegesterRequest(
      name: controllerName.text,
      email: controllerEmail.text,
      password: controllerPassword.text,
      confirmPassword: controllerConfirmPassword.text,
      phone: controllerPhone.text,
      avatarId: 2,
    );

     provider.signUp(request,context);


  }
}
