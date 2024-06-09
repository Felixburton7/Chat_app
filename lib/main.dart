// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_app/core/secrets/secrets.dart';
import 'package:my_chat_app/core/utils/constants/constants.dart';
import 'package:my_chat_app/core/utils/widgets/bottom_navigation.dart';
import 'package:my_chat_app/features/chat/presentation/views/splash_page.dart';
import 'package:my_chat_app/features/articles/presentation/bloc/article_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArticleBloc()),
        // Add other BLoCs here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Chat App',
        theme: appTheme,
        home: const SplashPage(),
      ),
    );
  }
}

// SplashPage should navigate to BottomNavigation once the app is ready
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate loading and then navigate to BottomNavigation
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BottomNavigation()),
      );
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
