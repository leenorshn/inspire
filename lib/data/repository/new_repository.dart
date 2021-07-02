import 'package:inspire/data/data_source/news_api.dart';
import 'package:inspire/data/models/news.dart';

import '../models/news.dart';

class NewsRepository {
  final NewsApi newsApi;

  NewsRepository(this.newsApi);

  Future<Result> getArticleResults() async {
    Map<String, dynamic>? data = await newsApi.getNews();
    //print(">>>>> ${data.toString()}");
    // return data!.map((k){
    //   return Article.fromJson(k)
    // });

    return Result.fromJson(data!);
  }
}
