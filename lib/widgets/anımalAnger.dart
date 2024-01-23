/*
Bu sayfada  olay adı kızgılık olsturlup  baslangıc saati pik saati veridi  altında driver 
 koyulup  ideal tohumlama zamanı eklndı   tarih ve saat bildirildi
*/

import 'package:flutter/material.dart';

class AnimalAnger extends StatelessWidget {
  // AnimalAnger sınıfının constructor'ı tanımlanır ve key parametresi alır
  const AnimalAnger({super.key});
  final MainAxisAlignment alignment = MainAxisAlignment.spaceBetween;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Olay başlığı oluşturulur
            Text(
              "Olay Adı: Kızgınlık",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            // Metin öğeleri için _textTile metodu kullanılır
            _textTile(
                context, "Başlangıç Saati", "02.11.2023 12:00", alignment),
            _textTile(context, "Pik Saati", "02.11.2023 12:00", alignment),
            _textTile(context, "Bitiş Saati", "02.11.2023 12:00", alignment),
            // İdeal Tohumlama Zamanı bölümü oluşturulur
            Column(
              children: [
                _divider(),
                Text(
                  "İdeal Tohumlama Zamana",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 1),
                _textTile(context, "02.11.2023 12:00", "02.11.2023 12:00",
                    MainAxisAlignment.spaceAround)
              ],
            )
          ],
        ),
      ),
    );
  }

  // Metin öğelerini oluşturan metot
  Padding _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Divider(
        height: 2,
        thickness: 2,
        color: Colors.black,
      ),
    );
  }

//padding text title  boyutu regı  yazdırılıyor
  Padding _textTile(BuildContext context, String title, String subtitle,
      MainAxisAlignment alignment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white),
          ),
          Text(subtitle,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
