import 'package:flutter/material.dart';
import '../widgets/home/home_heading.dart';
import 'package:favorites_cartoons/widgets/home/character_item.dart';
import 'package:favorites_cartoons/models/characters.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = new PageController(viewportFraction: 1);

  var appBarTitleOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        AppBar Widget
        Contains a back leading icon
        and a search icon action
      */
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [

          /*
            Heading widget containing title and subtitle
          */
          HomeHeading(),
          Expanded(
            /*
              Lets use a PageView Widget for the carousel
            */
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                /*
                  CharacterWidget will receive a Character Model Item,
                  the page view controller and the item position in the list
                */
                for (var i = 0; i < characters.length; i++)
                  CharacterWidget(
                    character: characters[i],
                    controller: _controller,
                    position: i,
                  ),
              ],
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  /* 
    Make sure we dispose the controller when leaving this page
  */
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
