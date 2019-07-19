import '../screens/character_screen_custom_sliver.dart';

import '../widgets/characters.dart';
import 'package:flutter/material.dart';
import '../widgets/AppTheme.dart';
import 'fade_router_widget.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController controller;
  final int currentPage;

  const CharacterWidget({
    Key key,
    this.character,
    this.controller,
    this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          FadeRoute(
            // page: CharacterScreen(character: character),
            page: CharacterScreenCustomSliver(character: character),
          ),
        );
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Hero(
                      tag: "background-${character.id}",
                      child: Container(
                        width: screenWidth - 30.0,
                        height: screenHeight * 0.25,
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 15.0,
                              offset: new Offset(0.0, 0.0),
                            ),
                          ],
                          gradient: LinearGradient(
                              colors: character.colors,
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(-20.0, 0.0),
                          child: Hero(
                            tag: "image-${character.id}",
                            child: Image.asset(
                              character.imagePath,
                              height: screenWidth *
                                  0.5 *
                                  value, // use value to animate the image
                            ),
                          ),
                        )
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0.0, -30.0),
                      child: Column(
                        children: <Widget>[
                          // TO MAKE TEXT TRANSITION TO WORK IN HERO
                          // NEED TO WRAP IT WITH A MATERIAL WIDGET

                          Hero(
                            tag: "heading-${character.id}",
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  character.name,
                                  style: AppTheme.heading,
                                ),
                              ),
                            ),
                          ),

                          Hero(
                            tag: "subheading-${character.id}",
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  "Tap to read more",
                                  style: AppTheme.subHeading,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
