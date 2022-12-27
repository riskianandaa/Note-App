import 'package:flutter/material.dart';
import 'package:noteapp/core/widgets/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onClick,
      required this.title,
      required this.icon,
      this.color = Colors.black});

  final Function onClick;
  final String title;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTheme().labelTitleMulish.copyWith(color: color),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
