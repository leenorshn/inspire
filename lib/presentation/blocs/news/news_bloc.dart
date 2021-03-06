import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inspire/data/repository/article_help_db.dart';
import 'package:inspire/data/repository/new_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc({required this.newsRepository}) : super(NewsLoading());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is LoadNews) {
      yield NewsLoading();
      try {
        var data = await newsRepository.getArticleResults();
        yield NewsLoadedSuccess(data);
      } catch (e) {
        print(e.toString());
        yield NewsLoadedFailure(e);
      }
    }
  }
}
