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
    IntoxPage(),
    RCAPage(),
    CongoBrazaPage(),
    NewsPage()
  ];
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congo Check"),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: "Fake-check",
            ),
            Tab(
              text: "Intox",
            ),
            Tab(
              text: "RCA-Desk",
            ),
            Tab(
              text: "Desk-congoBrazza",
            ),
            Tab(
              text: "Actualité",
            ),
          ],
        ),
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
      body: TabBarView(
        controller: _tabController,
        children: pages,
      ),
    );
  }
}
