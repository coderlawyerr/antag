/*
burası bızım ana sayfamızı gıen kısım  steatless sınıfı olusturduk ve   home kızsımı 
sayfanın nereye gıtmesını gerketıgını soyluyor
*/
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screen/angerlist.dart';
import 'package:flutter_application_1/screen/animal.dart';
import 'package:flutter_application_1/screen/dashboard.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/splash_screen.dart';
import 'package:flutter_application_1/widgets/grapichh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //sayfanın nereye gıtmesı gerektıgını soyluyor
      home: Splash(),
    );
  }
}
