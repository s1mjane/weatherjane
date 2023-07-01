import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_look/app.dart';
import 'package:weather_look/firebase_options.dart';

Future<void> main() async {
  //KakaoSdk.init(nativeAppKey: '66f8ad7afa5171a7d8923c9e6f94e6e1');

  // 비동기 방식으로 파이어베이스 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const WeatherLook());
}
