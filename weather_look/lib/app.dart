import 'package:flutter/material.dart';
import 'package:weather_look/pages/signup.dart';
import 'pages/createUser.dart';
import 'pages/forgotPwd.dart';
import 'pages/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'pages/resetPwd.dart';
import 'pages/sendEmail.dart';

class WeatherLook extends StatelessWidget {
  const WeatherLook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Look',
      initialRoute: '/',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignUpPage(),
        '/sendEmailPage': (BuildContext context) => const sendEmailPage(),
        '/createUser': (BuildContext context) => const createUserPage(),
        '/forgotPwd': (BuildContext context) => const forgotPwdPage(),
        '/resetPwd': (BuildContext context) => const resetPwdPage(),
      },
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('asset/image/weatherlook_logo.png'),
        splashIconSize: 362,
        nextScreen: const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
      ),
    );
  }
}
