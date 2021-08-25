import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync:
          this, //we made this class single ticker provider, bcz on the change of this class animation will change - this is fo// r class
      //upperBound: 100.0,
    );

    controller.forward(); // making our controller work

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.addListener(() {
      //listening changes of our controller
      setState(
          () {}); //so that background color can we changed who are controller values are changing
      print(animation
          .value); // controller will change values from 0 , 0.1 till 1 in 1 sec
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller
        .dispose(); //when our app stops, controller also needs to be dispose, this way it doesnt stay in memory
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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 50.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flesh Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: kRoundedButtonColor,
              text: 'Log in',
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              text: 'Register',
              function: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
