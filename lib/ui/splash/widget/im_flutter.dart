import 'package:flutter/material.dart';
import 'package:noteapp/core/widgets/app_theme.dart';

class ImFlutter extends StatelessWidget {
  const ImFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note_alt, color: Colors.green, size: 24),
            Text(
              "My Note",
              style: AppTheme()
                .textTheme
                .headline4
                ?.copyWith(color: Colors.green)
            )
          ],
        ));
  }
}
