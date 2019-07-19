import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../widgets/AppTheme.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Cartoons", style: AppTheme.display1),
                TextSpan(text: "\n"),
                TextSpan(text: "characters", style: AppTheme.display2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
