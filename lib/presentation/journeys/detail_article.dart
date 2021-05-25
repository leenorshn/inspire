import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/models/news.dart';

class DetailArticle extends StatefulWidget {
  final Article article;

  const DetailArticle({Key? key, required this.article}) : super(key: key);

  @override
  _DetailArticleState createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.widget.article.title}"), //title
        elevation: 0,
      ),
      body: Container(
        child: WebView(
          initialUrl: '${widget.article.link}',
        ),
      ),
    );
  }
}
