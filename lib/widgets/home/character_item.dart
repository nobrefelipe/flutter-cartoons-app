import 'package:flutter/material.dart';
import '../../models/characters.dart';
import '../../theme/AppTheme.dart';
import '../fade_router_widget.dart';
import '../../screens/character_screen_custom_sliver.dart';

/*
  CharacterWidget
  this widget is used by the PageView widget to display 
  a character slideshow.

  It has:
   - a gradient background color
   - a character image
   - a title
   - a subtile
  
  The character image will animate when the user swipe between the slides
  to do that we use the PageController from the PageView Widget

  @param character, a Character Model item
  @param pageController, a PageController from the PageView Widget
  @param position, the position of the slide in the characters list

*/

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController controller;
  final int position;

  const CharacterWidget({
    Key key,
    this.character,
    this.controller,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Screen Height
    final screenHeight = MediaQuery.of(context).size.height;

    /*
      The character item will be a Container widget 
      with some padding around it to space the items between themselves.      
    */
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),

      /*
        Then a GestureDetector child will manage the onTap event, 
        where we use a custom Navigator Route Effect, 
        to have the Fade In Effect betwwen routes
      */
      child: GestureDetector(
        // On tap go to the Character Screen using the FadeRoute custom routing
        onTap: () {
          Navigator.push(
            context,
            FadeRoute(
              page: CharacterScreen(character: character),
            ),
          );
        },

        /*
          We need to use a AnimatedBuilder because we want to scale the character image based on scroll
          so flutter will rebuild the widget everythime the controller changes
        */
        child: AnimatedBuilder(
          // the PageViewController passed from the home page
          animation: controller,

          builder: (context, child) {
            /*
              In order to animate the the character images
              we need to calculate a value that ranges between 0.0 and 1.0
              based on the current position of the charcter item on the carousel
            */

            // 1st - before any scroll interaction let's set the value to 1
            // so the image will be at it's normal size at the begining
            double value = 1.0;

            // 2nd - check if the user is swiping the carousel
            if (controller.position.haveDimensions) {
              // 3th - We want the current slide image to have a normal size (not scaled)
              // for that we need to make the current page value be equal to zero
              // we do that by subtracting the postion of the slide by  the current page
              // eg.: page index = 2, current page = 2 => position - controller.page 2 -2 = 0
              // this value will always be 0 for the current slide
              // for the next slide it will be 1.0 (when swiping it will animate from 0.0 to 1.0)
              // for the prev slide it will be -1.0 (when swiping it will animate from 0.0 to -1.0)
              value = position - controller.page;

              // 4th - Now we need to animate the image from the other slides (prev and next),
              // to do that wee need a multiplier to change the image height
              // this multiplier need to have a value betwwen 0 and 1, thus the subtraction (1 - ....)
              // user value.abs() to make sure the value is positive (it can be negative for the previous pages)
              // 0.6 is the number I think is optimial for this animation
              value = (1 - (value.abs() * 0.6));
            }

            /*
              The slide item will be a Stack Widget
              so we can stack and position the elements within it
            */
            return Stack(
              children: <Widget>[
                /*
                  1st STACKED WIDGET 
                  This is the colourful background.
                  We need it to be a Container Widget with 80px padding from the top
                  so the character image overflows the colourful background
                */
                Container(
                  padding: EdgeInsets.only(top: screenHeight * 0.15),

                  /*
                    The transition between pages magic happens here.
                    The Hero Widget will be responsible for transitioning the colourful 
                    background to the full page size backgorund on the character detail page.
                    We pass a unique tag parameter to identify it
                  */
                  child: ClipPath(
                    /*
                      Use Custom Clip Path to shape the background
                    */
                    clipper: CharacterCardBackgroundClipper(),
                    child: Hero(
                      tag: "background-${character.id}",

                      /*
                        The colourfull box itself
                        It takes it's gradient colours from the Character Model colors
                      */
                      child: Container(
                        decoration: BoxDecoration(
                          // Use border radius here as well so we have 
                          // a better transition between the routes
                          borderRadius:  BorderRadius.all(const Radius.circular(30.0)),
                          gradient: LinearGradient(
                              colors: character.colors,
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                        ),
                      ),
                    ),
                  ),
                ),

                /*
                  2nd STACKED WIDGET 
                  This is the character image.
                  It is also a Hero Widget so we can have it scaled up when
                  the user taps the slide item and transiton to the detal page.

                */
                Positioned(
                  top: screenHeight * 0.1,
                  right: 0,
                  left: 0,
                  child: Container(
                    child: Hero(
                      tag: "image-${character.id}",

                      /*
                        Here we use the Value we calculeted before to 
                        animate the image size depending on the slide position.
                        In this case the images will scale down when the user swipes the carousel

                        Use screenWidth so the image will always depend on the screen width
                        0.55 is the multiplier value I found was best for this case
                        the bigger the value, the bgger the image
                      */
                      child: Image.asset(
                        character.imagePath,
                        height: screenWidth * 0.8 * value,
                      ),
                    ),
                  ),
                ),

                /*
                  3th STACKED WIDGET
                  This widget contains the title and subtitle fo the slide
                */
                Positioned(
                  bottom: 60,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /*
                        The title and subtitle will be  Hero Widgets 
                        so they animate to the detail page
                      */
                      Hero(
                        tag: "heading-${character.id}",
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
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
            );
          },
        ),
      ),
    );
  }
}

/*
  CharacterCardBackgroundClipper
  This is the clip that will give shape to our colourful background
*/
class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    // Set the Path
    Path clippedPath = Path();

    // Set the curve radius of our border radius
    // use this value to drawn the border radius
    // and to drawn out lines. 
    double curveDistance = 40;

    // Move our path to start from left  and about half of the height
    clippedPath.moveTo(0, size.height * 0.4);

    // Drawn the line to the bottom of the widget - the radius of the border
    clippedPath.lineTo(0, size.height - curveDistance);

    // Drawn the bottom left border radius
    clippedPath.quadraticBezierTo( 0, size.height , curveDistance, size.height);

    // Drawn the line to the bottom right corner
    clippedPath.lineTo(size.width - curveDistance, size.height);

    // Drawn the bottom right border radius
    clippedPath.quadraticBezierTo(size.width, size.height, size.width, size.height - curveDistance);
    
    // Drawn the line to the top right corner
    clippedPath.lineTo(size.width, curveDistance);

    // Drawn the top right border radius
    clippedPath.quadraticBezierTo(size.width, 0,  size.width - curveDistance , 0 + curveDistance / 3);
    
    // Drawn the line to the top left corner
    clippedPath.lineTo(curveDistance, size.height * 0.29);

    // Drawn the top left border radius
    clippedPath.quadraticBezierTo( 1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
