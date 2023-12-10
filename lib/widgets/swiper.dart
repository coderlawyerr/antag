// ignore_for_file: use_key_in_widget_constructors

/*
burada swiper olusturduk swıperın amacı
burada  ıkı farklı  sınıfıntakı kartı ve  grafıgı kaydırmaya yarıyor 

*/
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_application_1/widgets/an%C4%B1malAnger.dart';
import 'package:flutter_application_1/widgets/grapichh.dart';

class Swiperr extends StatelessWidget {
  const Swiperr({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3, // İstenilen yükseklik
      child: Swiper(
        //İlk slayt hayvan öfkesi widget'ını içerir
        // İkinci slayt grafik örneği widget'ını içerir
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? const AnimalAnger() : const LineChartSample2();
        },
        itemCount: 2,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
