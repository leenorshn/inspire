import 'package:flutter/material.dart';
import 'package:inspire/presentation/journeys/pages/fake_page.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos COVID-19"),
        elevation: 1,
      ),
      body: Container(
        child: FakePage(),
      ),
    );
  }
}
