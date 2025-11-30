import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/app_validatores.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';
import 'package:movie/dialog/dialog.dart';
import 'package:movie/presentation/main_layout/tabs/profile/data/models/ResetPassword.dart';
import 'package:movie/presentation/main_layout/tabs/profile/presentation/profile_cubit/profile_cubit.dart';

import '../../../../../../core/colors_manger.dart';
import '../../domain/entity/profile_entity.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  void dispose() {
    // TODO: implement dispose
    oldPassword.dispose();
    newPassword.dispose();
    super.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
  }

  late TextEditingController oldPassword = TextEditingController();
  late TextEditingController newPassword = TextEditingController();
  bool secure = true;
  bool isSecure = true;
 late ProfileEntity argument;
 GlobalKey<FormState> formKey =GlobalKey<FormState>();
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
     argument = ModalRoute.of(context)!.settings.arguments as ProfileEntity;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reset password'),
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          key: formKey,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFiled(
              validation: (value) => AppValidators.validateConfirmPassword(value, argument.password),
              title: 'Old Password',
              prefixIcon: Icon(Icons.lock),
              controller: oldPassword,
              suffixIcon: isSecure ? Icons.visibility_off : Icons.visibility,
              isSecure: isSecure,
              onClick: () {
                setState(() {
                  isSecure=!isSecure;
                });
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextFormFiled(

              validation: (value) => AppValidators.validatePassword(value),
              title: 'New Password',
              prefixIcon: Icon(Icons.lock),
              controller: newPassword,
              suffixIcon: secure ? Icons.visibility_off : Icons.visibility,
              isSecure: secure,
    onClick: () {
    setState(() {
    secure=!secure;
    });}
            ),
            Spacer(),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccessState) {
                  Dialogs.showMessageDialog(context,
                      message: "Password Reset Successfully");
                  Future.delayed(
                    Duration(seconds: 2),
                    () => Dialogs.hideDialog(context),
                  );
                }
                if (state is ResetPasswordErrorState) {
                  Dialogs.showMessageDialog(context, message: state.message);
                  Future.delayed(
                    Duration(seconds: 2),
                    () => Dialogs.hideDialog(context),
                  );
                }
                if (state is ResetPasswordErrorState) {
                  Dialogs.showLoadingDialog(context, " wait..");
                }
              },
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManger.yellow,
                      foregroundColor: ColorsManger.dark),
                  onPressed: () {
                    if(!formKey.currentState!.validate())return;
                    context
                        .read<ProfileCubit>()
                        .resetPassword(ResetPasswordRequest(
                          newPassword: newPassword.text,
                          oldPassword: oldPassword.text,
                        ));
                  },
                  child: Text('Reset PassWord')),
            ),
          ],
        ),
      ),
    );
  }
}
