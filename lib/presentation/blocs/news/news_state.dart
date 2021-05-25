part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoadedSuccess extends NewsState {
  late final Result result;

  NewsLoadedSuccess(this.result);

  @override
  List<Object> get props => [this.result];

  @override
  bool get stringify => true;
}

class NewsLoadedFailure extends NewsState {
  final Object error;

  NewsLoadedFailure(this.error);

  @override
  List<Object> get props => [this.error];

  @override
  bool get stringify => true;
}
