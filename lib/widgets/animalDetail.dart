/*
  Bu kısım, Flutter'ın materyal tasarımı için gerekli olan kütüphaneyi
  içe aktarıyor. Bu kütüphane, görsel arayüz öğelerini oluşturmak ve
  düzenlemek için kullanılır.
*/
import 'package:flutter/material.dart';

/*
  AnimalDetailWidget adında bir StatelessWidget sınıfı oluşturuluyor.
  Bu sınıf, detayları görüntülemek için bir hayvan kartı oluşturur.
*/
class AnimalDetailWidget extends StatelessWidget {
  const AnimalDetailWidget(
      {super.key,
      required this.ciftlikNo,
      required this.grup,
      required this.jinek,
      required this.lokasyonGunu,
      required this.lokasyonSayisi});

  final String ciftlikNo;
  final String grup;
  final String jinek;
  final String lokasyonGunu;
  final String lokasyonSayisi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 210,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        // Hayvanın çiftlik numarasını tutan bir String değişkeni, grup tutan ,jinek numarasını tutan,lokayasyon
        ///tutyor

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _textTilel(context, "Çiftlik No", ciftlikNo),
          _textTilel(context, "Grup", grup),
          _textTilel(context, "Jinek No", jinek),
          _textTilel(context, "lokasyon Günü", lokasyonGunu),
          _textTilel(context, "Lokasyon Sayisi", lokasyonSayisi),
        ],
      ),
    );
  }

  /*
    Metin başlık ve altbaşlık içeren bir satır oluşturmak için kullanılan
    özel bir yardımcı fonksiyon. Bu, tekrar eden UI öğelerini oluşturmak
    için kullanılır.
  */
  Row _textTilel(BuildContext context, String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 78),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
