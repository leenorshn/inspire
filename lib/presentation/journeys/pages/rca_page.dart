import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/news/news_bloc.dart';
import '../../widgets/news_tile.dart';
import '../detail_article.dart';

class RCAPage extends StatelessWidget {
  const RCAPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsLoadedSuccess) {
        return ListView.builder(
            itemCount: state.result.articles.length,
            itemBuilder: (context, index) {
              return NewsTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailArticle(
                        article: state.result.articles[index],
                      ),
                    ),
                  );
                },
                article: state.result.articles[index],
              );
            });
      }
      if (state is NewsLoadedFailure) {
        return Container(
          child: Center(
            child: Text(state.error.toString()),
          ),
        );
      }
      return Container(
        child: Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
