import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppBarTitle extends StatefulWidget {

  final PageController controller;

  const AppBarTitle({Key key, this.controller}) : super(key: key);

  @override
  _AppBarTitleState createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> with TickerProviderStateMixin {

  get offset => widget.controller.hasClients ? widget.controller.offset : 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (BuildContext context, Widget child) {
        return new AnimatedSize(
          curve: Curves.linear,
          child: Transform.scale(
            origin: Offset(0.0, 0.0),
            scale: 1,
            child: Opacity(

              // se a o resultado da opacidade for meno que 0, seto 0
              // se for maior que 1, seto 1
              // se for entre 0 e 1 e maior que 0.3, seto o current value
              // se nao seto 0
              // ou seja, nao pode ser meno que 0 nem maior que 1, 
              //e quero que comece a aparecer soh depois que o valor for maior que 0.3
              opacity: (((math.pi * offset) / 800) < 0) ? 0 : (((math.pi * offset) / 800) > 1) ? 1 : (((math.pi * offset) / 1000) >= 0.3) ? ((math.pi * offset) / 1000) : 0,
              child: Text("Cartoons", style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold, letterSpacing: 1.2),),

            ),
          ),
          vsync: this,
          duration: Duration(seconds: 0),
        );
      },
    );
  }
}
