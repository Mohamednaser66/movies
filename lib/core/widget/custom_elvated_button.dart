import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton(
      {super.key, required this.title, required this.onClick});

  final VoidCallback onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: onClick,
        child: Text(title, style: Theme.of(context).textTheme.labelMedium));
  }
}
