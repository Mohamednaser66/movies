import 'package:flutter/material.dart';

import '../colors_manger.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {super.key,
      required this.title,
      required this.preffixIcon,
      this.suffixIcon,
      this.isSecure = false,
      this.controller,
      this.onClick});

  final TextEditingController? controller;
  final String title;
  final IconData? suffixIcon;
  final IconData preffixIcon;
  final VoidCallback? onClick;
  bool isSecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          prefixIcon: Icon(
            preffixIcon,
            color: Theme.of(context).iconTheme.color,
          ),
          suffixIcon: IconButton(
              onPressed: onClick,
              icon: Icon(
                suffixIcon,
                color: Theme.of(context).iconTheme.color,
              ))),
    );
  }
}
