import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedHero extends StatelessWidget {
  final String image;
  final String characterId;
  final ScrollController controller;

  AnimatedHero({Key key, this.controller, this.image, this.characterId});

  get offset => controller.hasClients ? controller.offset : 0;

  @override
  Widget build(BuildContext context) {
    /*
      AnimatedBuilder needed because I want to scale the image based on scroll
      so flutter will rebuild the widget everythime the controller changes
    */
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {

        return Transform.translate(
          offset: Offset(0.0, offset),
          child: Container(
            height: ((300 - (math.pi * offset) / 2) <= 40)
                ? 40
                : (300 - (math.pi * offset) / 2),
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Hero(
                tag: "image-$characterId",
                child: Image.asset(
                  image,
                  height: 330,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
