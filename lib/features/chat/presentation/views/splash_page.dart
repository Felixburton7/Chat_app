import 'package:flutter/material.dart';
import 'package:my_chat_app/core/utils/constants/constants.dart';
import 'package:my_chat_app/features/chat/presentation/views/chat_page.dart';
import 'package:my_chat_app/features/chat/presentation/views/register_page.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

// Within this redirect method, we are fetching the auth state and navigating the user accordingly.
  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(Duration.zero);

    final session = supabase.auth
        .currentSession; //Current session is a supabase build in method that sees has access to the current session.
    if (session == null) {
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
    } else {
      Navigator.of(context)
          .pushAndRemoveUntil(ChatPage.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}
