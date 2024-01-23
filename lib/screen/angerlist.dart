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
        backgroundColor: const Color.fromARGB(230, 14, 38, 38),
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
                // color: Colors.white.withOpacity(0.2),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(225, 35, 35, 35),
                    ),
                    //baslık kısmı
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: titleItems[0]),
                        const VerticalDivider(
                            color: Colors.grey, thickness: 10),
                        Expanded(child: titleItems[1]),
                        const VerticalDivider(
                            color: Colors.grey, thickness: 10),
                        Expanded(child: titleItems[2]),
                      ],
                    ),
                  ),
                  //liste
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        ///table wıdget  map () fonksiyonu  liste içinde tüm elemanları  sıarayla dönüyor ve bir şeye dönüştürüyor
                        /// e de listenin elemanlarından bır tanesi.anger listten gelıyor
                        child: Table(
                          children: angerList
                              .asMap()
                              .map(
                                (index, e) => MapEntry(
                                  index,
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0
                                          ? const Color.fromARGB(
                                              230, 14, 38, 38)
                                          : const Color.fromARGB(
                                              230, 9, 72, 65),
                                    ),
                                    children: [
                                      //e anger lıstten gelıyor.
                                      TableCell(child: TitleItem(title: e[0])),
                                      TableCell(
                                        child: TitleItem(
                                          title: e[1],
                                          onTap: () {
                                            pageNavigator(context, Animal());
                                          },
                                        ),
                                      ),
                                      TableCell(child: TitleItem(title: e[2])),
                                    ],
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                        ),
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: InkWell(
          onTap: onTap,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ));
  }
}
