import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/authentication/data/models/avater_data_model.dart';
import 'package:movie/authentication/data/models/user_regester_request.dart';
import 'package:movie/authentication/presentation/Auth_view_model/auth_cubit.dart';
import 'package:movie/core/app_validatores.dart';
import 'package:movie/core/routes_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';
import 'package:movie/dialog/dialog.dart';
import '../widget/custom_text_button.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;


  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  int selectedAvatarIndex = 0;
 bool secure=false;
 bool isSecure=false;
 GlobalKey<FormState> formKey=GlobalKey<FormState>();
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
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                key: formKey,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider.builder(
                      itemCount: AvaterDataModel.avaters.length,
                      itemBuilder: (context, index, realIndex) {
                        return Image.asset(
                            AvaterDataModel.avaters[index].image);
                      },
                      options: CarouselOptions(height: 200.h,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.6,
                        viewportFraction: 0.4,
                        aspectRatio: 16 / 9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            selectedAvatarIndex = index;
                          });
                        },
                      )),
                  SizedBox(
                    height: 120.h,
                  ),
                  CustomTextFormFiled(
                    validation: (value) => AppValidators.validateUsername(value),
                      controller: nameController,
                      title: 'Name',
                      prefixIcon:Icon(Icons.account_box_rounded) ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormFiled(
                    validation: (value) => AppValidators.validateEmail(value),
                      controller: emailController,
                      title: 'Email',
                      prefixIcon:Icon(Icons.email_sharp) ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormFiled(
                    validation: (value) => AppValidators.validatePassword(value),
                    controller: passwordController,
                    title: 'Password',
                    prefixIcon:Icon( Icons.lock),
                    onClick:(){
                      setState(() {
                        secure=!secure;
                      });
                    },
                    isSecure:secure,
                    suffixIcon:
                    secure? Icons.visibility_off
                    : Icons.visibility,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormFiled(
                    validation: (value) => AppValidators.validateConfirmPassword(value, phoneController.text),
                    isSecure:isSecure,
                    onClick:(){setState(() {
                 isSecure=!isSecure;
                    });
                    }

                 ,
                    controller: confirmPasswordController,
                    title: 'ConfirmPassword',
                    prefixIcon:Icon(Icons.lock) ,

                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormFiled(

                    controller: phoneController,
                    title: 'Phone',
                    prefixIcon:Icon(Icons.phone) ,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                        Dialogs.showLoadingDialog(context, 'wait...');
                      }
                      else if (state is RegisterError) {
                        Dialogs.hideDialog(context);
                         Dialogs.showMessageDialog(
                            context, message: state.message);
                      }
                     else if (state is RegisterSuccess) {
                        Dialogs.hideDialog(context);
                        Navigator.pushReplacementNamed(context, RoutesManger.signIn);
                      }

                    },
                    child: CustomElevatedButton(
                        title: 'Create Account', onClick: _onClick),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have Account?',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
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
            ),
          )
      ),
    );
  }


  void _onClick() {
    if(!formKey.currentState!.validate())return;
    BlocProvider.of<AuthCubit>(context).register(UserRegisterRequest(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text,
        avatarId: selectedAvatarIndex)
    );
  }
}
