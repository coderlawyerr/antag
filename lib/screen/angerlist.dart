/*
Bu sayfada lisview.builder tanımladık yanı bır lıste olusturuyor ama 
 index çiftse koyu renk değilse açık renk kullanılıyor
 ve modellerı angerlıst olusturuldu sımple.dart sınıfın dan çağrıldı

*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Util/MiniNavigator.dart';
import 'package:flutter_application_1/data/simple_data.dart';
import 'package:flutter_application_1/screen/animal.dart';

class AngarList extends StatelessWidget {
  const AngarList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(11, 84, 73, 1),
        elevation: 0,

        ///başlık kısmı
        title: const Text("Kızgınlık Listesi"),
      ),
      body: SafeArea(
        child: Container(
          //bu kısım sayfanın gradiant olmasını sağlıyor
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.757),
                Color.fromRGBO(12, 99, 86, 0.757),
              ],
            ),
            image: DecorationImage(
              image: AssetImage(
                //arka plan resmi
                "assets/logo.png",
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white.withOpacity(0.2),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: titleItems,
                    ),
                  ),
                  //bir tane liste tanmladık
                  Expanded(
                    child: Center(
                      child: ListView.builder(
                        itemCount: angerList.length,
                        itemBuilder: (context, index) {
                          var item = angerList[index];
                          return Container(
                            // eger çifte  koyu değilse açık renkli olsun
                            color: index % 2 == 0
                                ? Colors.teal.shade700
                                : Colors.teal.shade400,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TitleItem(title: item[0]),
                                TitleItem(
                                  title: item[1],
                                  onTap: () {
                                    return pageNavigator(context, Animal());
                                  },
                                ),
                                TitleItem(title: item[2]),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// burada lısteye tıklanam ozellıgı ve  yazının  rengını ve boyutunu
class TitleItem extends StatelessWidget {
  const TitleItem({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ));
  }
}
