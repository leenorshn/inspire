import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psony/presentation/blocs/news/news_bloc.dart';
import 'package:psony/presentation/journeys/detail_article.dart';
import 'package:psony/presentation/journeys/pages/congobraza_page.dart';
import 'package:psony/presentation/journeys/pages/fake_page.dart';
import 'package:psony/presentation/journeys/pages/news_page.dart';
import 'package:psony/presentation/journeys/pages/rca_page.dart';
import 'package:psony/presentation/widgets/news_tile.dart';

import 'pages/intox_page.dart';

class TabMenu {
  final String name;
  final String value;

  TabMenu(this.name, this.value);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabs = [
    TabMenu("Fake-check", "Fake-check"),
    TabMenu("Intox", "Fake-check"),
    TabMenu("RCA-Desk", "Fake-check"),
    TabMenu("Desk-CongoBraza", "Fake-check"),
    TabMenu("Fake-check", "Fake-check"),
  ];
  var pages = [
    FakePage(),
    IntoxPage(),
    RCAPage(),
    CongoBrazaPage(),
    NewsPage()
  ];
  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Congo Check"),
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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              height: 43,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: tabs
                    .map(
                      (e) => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Tab(
                            text: e.name,
                          ),
                        ),
                        onTap: () {
                          print("${e.value}");
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            PageView.builder(
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                })
          ],
        ),
      ),
    );
  }
}
