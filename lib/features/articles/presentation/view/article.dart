import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_app/features/articles/presentation/bloc/article_bloc.dart';

class Article extends StatefulWidget {
  Article({super.key});

  final _inputText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  void initState() {
    super.initState();
    // Dispatch LoadArticles event when the widget is initialized
    context
        .read<ArticleBloc>()
        .add(LoadArticles(message: 'Passed into the event!'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Articles')),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleInitial) {
            return Center(child: Text('Hello world'));
          } else if (state is ArticleLoaded) {
            return Center(child: Text('Goodbye world'));
          }
          return Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
