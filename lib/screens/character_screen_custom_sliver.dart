import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/characters.dart';
import '../widgets/AppTheme.dart';
import '../widgets/character_image_widget.dart';

class CharacterScreenCustomSliver extends StatefulWidget {
  final Character character;

  const CharacterScreenCustomSliver({Key key, this.character}) : super(key: key);

  @override
  _CharacterScreenCustomSliverState createState() => _CharacterScreenCustomSliverState();
}

class _CharacterScreenCustomSliverState extends State<CharacterScreenCustomSliver> {
  ScrollController _controller = new ScrollController();
  Timer _timer;
  var _visible = false;

  @override
  void initState() {
    // Use time out to show the description fade in
    _timer = Timer(new Duration(milliseconds: 100), () {
      setState(() {
        _visible = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // BACKGROUND
          Hero(
            tag: "background-${widget.character.id}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius:
                    new BorderRadius.all(const Radius.circular(0.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 0.0,
                    offset: new Offset(0.0, 0.0),
                  ),
                ],
                gradient: LinearGradient(
                  colors: widget.character.colors,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),

          // CONTENT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             
              SizedBox(height: 40),
              // TOP BAR
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white70),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),

              // CONTENT BODY
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller,
                  padding: EdgeInsets.only(left:15.0, right: 15.0, bottom:15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // IMAGE
                      AnimatedHero(
                        controller: _controller,
                        image: widget.character.imagePath,
                        characterId: widget.character.id,
                      ),

                      SizedBox(height: 20),

                      // SUBHEADING
                      Hero(
                        tag: "subheading-${widget.character.id}",
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              widget.character.cartoon,
                              style: AppTheme.subHeading,
                            ),
                          ),
                        ),
                      ),

                      //HEADING
                      Hero(
                        tag: "heading-${widget.character.id}",
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              widget.character.name,
                              style: AppTheme.heading,
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 20),

                      // DESCRIPTION
                      AnimatedOpacity(
                        // If the widget is visible, animate to 0.0 (invisible).
                        // If the widget is hidden, animate to 1.0 (fully visible).
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 1000),
                        // The green box must be a child of the AnimatedOpacity widget.
                        child: Text(widget.character.description,
                            style: AppTheme.body),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
