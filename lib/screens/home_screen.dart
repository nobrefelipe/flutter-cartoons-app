import 'package:favorites_cartoons/widgets/AppTheme.dart';
import 'package:favorites_cartoons/widgets/characters.dart';

import 'package:flutter/material.dart';
import '../widgets/character.dart';
import '../widgets/characters.dart';
import '../widgets/facy_tab_bar.dart';
import '../widgets/tab_item.dart';
import '../widgets/app_header_widget.dart';
import '../widgets/app_bar_title_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = new PageController();

  var appBarTitleOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: FancyTabBar(),
      body: Column(
        children: [
          AppHeader(),
          Container(
            height: 320,
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (var i = 0; i < characters.length; i++)
                  CharacterWidget(
                    character: characters[i],
                    controller: _controller,
                    currentPage: i,
                  ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
