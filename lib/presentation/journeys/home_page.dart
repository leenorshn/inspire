import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:inspire/presentation/journeys/pages/fake_page.dart';
import 'package:inspire/presentation/journeys/pages/news_page.dart';

import 'pages/protocol_page.dart';

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
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Container();
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("signup");
                    },
                    child: Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.deepOrange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.person_3,
                            color: Colors.white,
                          ),
                          Text(
                            "Joindre notre communauté",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.chevron_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
                    text: "Protocoles",
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed("contact");
        },
        label: Text("Contactez-nous"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        icon: Icon(
          CupertinoIcons.bubble_right,
          color: Colors.white,
        ),
      ),
    );
  }
}
