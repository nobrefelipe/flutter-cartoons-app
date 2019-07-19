import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: CharacterCardBackgroundClipper(),
            child: Hero(
              tag: "background-minion",
              child: Container(
                width: screenWidth - 30.0,
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5.0,
                      offset: new Offset(0.0, 2.0),
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.blue],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(220.0, 0.0),
          child: Image.asset(
            "assets/images/minion.png",
            height: screenWidth * 0.5,
          ),
        )
      ],
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    
    clippedPath.lineTo(0, size.height - curveDistance);
    
    clippedPath.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    
    clippedPath.lineTo(size.width - curveDistance, size.height);
   
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width, size.height - curveDistance);
    
    clippedPath.lineTo(size.width, 0 + curveDistance);
    
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
   
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
