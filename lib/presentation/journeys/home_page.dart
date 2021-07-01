import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:psony/presentation/journeys/pages/congobraza_page.dart';
import 'package:psony/presentation/journeys/pages/fake_page.dart';
import 'package:psony/presentation/journeys/pages/news_page.dart';
import 'package:psony/presentation/journeys/pages/rca_page.dart';

import 'pages/intox_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var pages = [
    FakePage(),
    NewsPage(),
    IntoxPage(),
  ];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspire"),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.search,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.tag,
              // color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 44,
              child: TabBar(
                controller: _tabController,
                //isScrollable: true,
                tabs: [
                  Tab(
                    text: "Fake-check",
                  ),
                  Tab(
                    text: "Actualité",
                  ),
                  Tab(
                    text: "Intox",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
