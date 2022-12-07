import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcomescreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(vsync:this  ,
      duration: Duration(seconds: 1),
      
      upperBound:1,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();



    controller.addListener(() {
      setState(() {
      });

    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*80,
                  ),
                  tag: 'logo',
                ),
                 Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black54
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log in',color: Colors.lightBlueAccent,onpressed:  () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(color: Colors.blueAccent, title: 'Register', onpressed: () {
    Navigator.pushNamed(context, RegistrationScreen.id);
    //Go to registration screen.
    },)
          ],
        ),
      ),
    );
  }
}

