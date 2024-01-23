/*
 bu sayfamızda animaldetail custom cagrıldı 
four detil custom ve swipper customları cağrıldıgı yer 

*/

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'package:flutter_application_1/screen/shared.dart';
//import 'package:flutter_application_1/widgets/an%C4%B1malAnger.dart';
import 'package:flutter_application_1/widgets/animalDetail.dart';

import 'package:flutter_application_1/widgets/fourDetail.dart';

//import 'package:flutter_application_1/widgets/grapichh.dart';
import 'package:flutter_application_1/widgets/swiper.dart';

class Animal extends StatelessWidget {
  Animal({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                //arka plan resim
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 31, 65, 62).withOpacity(.98),
            child: ListView(scrollDirection: Axis.vertical, children: [
              AppBar(
                centerTitle: true,
                title: const Text(
////////////////baslık
                  "Hayvan Detay",
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),

              ///animal detail custom burda
              const AnimalDetailWidget(
                ciftlikNo: "004432",
                grup: "Düve",
                jinek: "Geve Düve",
                lokasyonGunu: "10",
                lokasyonSayisi: "1",
              ),
              //four detail kısmını burda çağırdık
              const FourDetail(),
////////////////swiper kısmı burada çağırdık
              const SizedBox(height: 8),
              const Swiperr(),
              const SizedBox(height: 3),
              TextButton(
                onPressed: () {
                  SharedPreferencesHelper().deletelogin();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text("çıkış"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
