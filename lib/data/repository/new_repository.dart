import 'package:inspire/data/data_source/news_api.dart';
import 'package:inspire/data/models/news.dart';

import '../models/news.dart';
import 'article_help_db.dart';

class NewsRepository {
  final NewsApi newsApi;
  final NewsProvider newsProvider;

  NewsRepository(this.newsApi, this.newsProvider);

  Future<List<News>> getArticleResults() async {
    Map<String, dynamic>? data = await newsApi.getNews();
    var news = Result.fromJson(data!);
    await newsProvider.open("news.db");
    var newsResult = await newsProvider.getNews();
    news.articles.forEach((element) async {
      var t = await newsProvider.getOneNews(element.title!.rendered);
      if (t == null) {
        await newsProvider.insert(
          News(
            content: "${element.excerpt!.rendered}",
            title: element.title!.rendered,
            createdAt: "${element.date}",
            imageUrl: element.betterFeaturedImage!.sourceUrl,
          ),
        );
      }
    });

    return newsResult;
  }
}
