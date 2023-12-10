/*
animal sayfasındaki 4 adet benzer kutuyu bır
custom wıdget  olusturduk
 four detil itemde title rengini yazması gereken olaylar yazıldı
*/
import 'package:flutter/material.dart';

class FourDetail extends StatelessWidget {
  const FourDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //burada  kutuların ıcınde  ne gormek ıstıyorsak yazdık yazısı,sapma yüzdesi,gunluk ındex
        Row(
          children: [
            FourDetailItem(
              title: "Adım Sayısı",
              color: Colors.red,
              sapmaYuzdesi: "68",
              gunlukIndeks: "86",
              saatlikIndeks: "58",
            ),
            FourDetailItem(
              title: "Ayakta Süresi",
              color: Colors.blue,
              sapmaYuzdesi: "68",
              gunlukIndeks: "86",
              saatlikIndeks: "58",
            ),
          ],
        ),
        Row(
          children: [
            FourDetailItem(
              title: "Yatma Kalma Sayısı",
              color: Colors.green,
              sapmaYuzdesi: "68",
              gunlukIndeks: "86",
              saatlikIndeks: "58",
            ),
            FourDetailItem(
              title: "Yatma Süresi",
              color: Colors.yellow,
              sapmaYuzdesi: "68",
              gunlukIndeks: "86",
              saatlikIndeks: "58",
            ),
          ],
        ),
      ],
    );
  }
}

class FourDetailItem extends StatelessWidget {
  //// kutunun  ozellıklerını modelllıyoruz
  const FourDetailItem({
    super.key,
    required this.color,
    required this.sapmaYuzdesi,
    required this.gunlukIndeks,
    required this.saatlikIndeks,
    required this.title,
  });
  final Color color;
  final String sapmaYuzdesi;
  final String gunlukIndeks;
  final String saatlikIndeks;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(.5),
          borderRadius: _borderRadius(),
        ),
        child: Column(
          //extension kullanıldı
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 6),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            _textTilel(context, "Sapma\nYüzdesi", sapmaYuzdesi),
            _textTilel(context, "10 Günlük", gunlukIndeks),
            _textTilel(context, "24 Saatlik", saatlikIndeks),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  BorderRadius _borderRadius() {
    return const BorderRadius.only(
        topLeft: Radius.circular(20), bottomRight: Radius.circular(20));
  }

  ///yazının boyutu
  Row _textTilel(BuildContext context, String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 70,
        ),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white)),
      ],
    );
  }
}
