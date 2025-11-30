import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onClick,
    this.image,
  });

  final VoidCallback onClick;
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onClick,
       child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (image != null) ...[
          SvgPicture.asset(image!, height: 24),
          SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    ),
    );
  }
}