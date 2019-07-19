import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedHero extends StatefulWidget {

  final String image;
  final String characterId;
	final ScrollController controller;
  
	AnimatedHero({Key key, this.controller, this.image, this.characterId}) : super(key: key);

	@override
	_AnimatedHeroState createState() => _AnimatedHeroState();
}

class _AnimatedHeroState extends State<AnimatedHero>  with TickerProviderStateMixin{

	get offset => widget.controller.hasClients ? widget.controller.offset : 0;

	@override
	Widget build(BuildContext context) {
	
		return AnimatedBuilder(

			animation: widget.controller,
			builder: (BuildContext context, Widget child) {

				return  new AnimatedSize(

                curve: Curves.linear, 
                child: Container(
                  height: ((300 - (math.pi * offset)/ 2 ) <= 40) ? 40 : (300 - (math.pi * offset)/ 2 ),
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Hero(
                      tag: "image-${widget.characterId}",
                      child: Image.asset(
                        widget.image,
                        height: 330,
                      ),
                    ),
                  )
                  // child: Transform.scale(
                  //   scale: (1 - (math.pi * offset) / 1024),
                  //   child:  Image.network(widget.image)
                  // ),
                ),
				
              vsync: this, 
              duration:  Duration(seconds: 2));
        
        
      }
    );
	}
}
