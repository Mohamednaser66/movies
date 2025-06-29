import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/assets_manger.dart';
import 'package:movie/core/widget/custom_elvated_button.dart';
import 'package:movie/core/widget/custom_text_form_filed.dart';

class RestPassWard extends StatelessWidget{
  const RestPassWard({super.key});


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back)),
      title: Text('Forget Password'),
    ),
    body: Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImagesManger.forgetPassword),
          SizedBox(height: 24.h,),
          CustomTextFormFiled(title: 'Email', preffixIcon: Icons.email_sharp),
          SizedBox(height: 24.h,),
          CustomElvatedButton(title: 'Verify Email', onClick: (){})
        ],
      ),
    ),
  );
  }

}