import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadArticles>(_onLoadArticles);
  }

  void _onLoadArticles(LoadArticles event, Emitter<ArticleState> emit) async {
    //simulate fetching articles
    await Future.delayed(Duration(seconds: 5));

    emit(ArticleLoaded());
  }
}
