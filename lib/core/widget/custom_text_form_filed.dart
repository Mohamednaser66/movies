import 'package:flutter/material.dart';

import '../colors_manger.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {super.key,
      required this.title,
      required this.prefixIcon,
      this.suffixIcon,
      this.isSecure = false,
      this.controller,
      this.onClick,
      this.validation});

  final TextEditingController? controller;
  final String title;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onClick;
  bool isSecure;
  FormFieldValidator<String>? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction,
      validator:validation ,
      controller: controller,
      cursorColor: ColorsManger.white,
      obscureText: isSecure,
      style: TextStyle(
        color: ColorsManger.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          hintText: title,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
              onPressed: onClick,
              icon: Icon(
                suffixIcon,
                color: Theme.of(context).iconTheme.color,
              ))),
    );
  }
}
