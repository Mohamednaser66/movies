import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
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
        Flexible( // أو Expanded لو تحب
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis, // ← يمنع كسر التصميم
            softWrap: false,
          ),
        ),
      ],
    ),
    );
  }
}