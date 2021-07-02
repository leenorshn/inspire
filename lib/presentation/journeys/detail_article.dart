import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inspire/presentation/blocs/detail/webview_bloc.dart';
import 'package:inspire/presentation/widgets/loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/models/news.dart';

class DetailArticle extends StatefulWidget {
  final Article article;

  const DetailArticle({Key? key, required this.article}) : super(key: key);

  @override
  _DetailArticleState createState() => _DetailArticleState();
}

class _DetailArticleState extends State<DetailArticle> {
  final _key = UniqueKey();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading;

  final LoadingWebPageBloc loadingWebPageBloc = LoadingWebPageBloc();

  @override
  void initState() {
    super.initState();
    isLoading = true;

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    isLoading = false;
    loadingWebPageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              WebView(
                key: _key,
                initialUrl: '${widget.article.link}',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                  setState(() {});
                },
                onPageStarted: (value) {
                  print("_____ --- $value");
                  setState(() {
                    loadingWebPageBloc.changeLoadingWebPage(true);
                  });
                },
                onPageFinished: (value) {
                  loadingWebPageBloc.changeLoadingWebPage(false);
                },

                //gestureNavigationEnabled: true,
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                left: MediaQuery.of(context).size.width / 2 - 32,
                child: StreamBuilder<bool>(
                    stream: loadingWebPageBloc.loadingWebPageStream,
                    initialData: true,
                    builder: (context, snap) {
                      if (snap.data == true) {
                        return Center(
                          child: Loading(),
                        );
                      }
                      return SizedBox();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
