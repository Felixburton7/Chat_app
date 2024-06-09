part of 'article_bloc.dart';

@immutable
sealed class ArticleEvent {}

class LoadArticles extends ArticleEvent {
  final String message;
  LoadArticles({required this.message});
}
