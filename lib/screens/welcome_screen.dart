import 'package:chat_central/screens/login_screen.dart';
import 'package:chat_central/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_central/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync:
            this //Who's going to provide the ticker? This, the very object created from this Welcome Screen class itself.
        );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 130,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Chat Central',
                      textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 52.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonTitle: 'Log in',
              buttonColor: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              buttonTitle: 'Register',
              buttonColor: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
