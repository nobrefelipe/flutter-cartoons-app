import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../widgets/AppTheme.dart';

class AppHeader extends StatefulWidget {
  final ScrollController controller;

  const AppHeader({Key key, this.controller}) : super(key: key);

  @override
  _AppHeaderState createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> with TickerProviderStateMixin {
  get offset => widget.controller.hasClients ? widget.controller.offset : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget child) {
        return new AnimatedSize(
          curve: Curves.linear,
          child: Transform.scale(
             origin: Offset(-200.0, 0.0),
            scale: ((1 - (math.pi * offset) / 800)),
            child: Opacity(
              opacity: ((1 - (math.pi * offset) / 150) <= 0)
                  ? 0
                  : ((1 - (math.pi * offset) / 150) >= 1)
                      ? 1
                      : (1 - (math.pi * offset) / 150),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Cartoons", style: AppTheme.display1),
                    TextSpan(text: "\n"),
                    TextSpan(text: "characters", style: AppTheme.display2)
                  ]),
                ),
              ),
            ),
          ),
          vsync: this,
          duration: Duration(seconds: 0),
        );
      },
    );
  }
}
