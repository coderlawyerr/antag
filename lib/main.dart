/*
burası bızım ana sayfamızı gıen kısım  steatless sınıfı olusturduk ve   home kızsımı 
sayfanın nereye gıtmesını gerketıgını soyluyor
*/
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screen/shared.dart';

import 'package:flutter_application_1/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Uygulama çalışmadan önce sharedPreferences kullanabilmek için bu fonksiyonu
  SharedPreferencesHelper preferences =
      SharedPreferencesHelper(); // nesne oluşturuyoruz
  // burda sharedpreferences oluşturup çalıştırıyoruz.
  await preferences
      .initialize(); //shred pref nesnesını olusturmammaız ıcın beklememız lazım

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
