/*
burada splash ekranı yapımına yatık acılısta flutter logosu gıtmesını sagladık

*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/dashboard.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/shared.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
/////////burada admın gırıs yapmıs mı dıye kontrol edıyoruz
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      //////lontrol
      bool isAdmin = SharedPreferencesHelper().isAdmin("aa", "1907");
      if (isAdmin) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
