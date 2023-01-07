import 'package:flutter/material.dart';
import 'package:chat_central/screens/welcome_screen.dart';
import 'package:chat_central/screens/login_screen.dart';
import 'package:chat_central/screens/registration_screen.dart';
import 'package:chat_central/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatCentral());
}

class ChatCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      //home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
