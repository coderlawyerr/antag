import 'package:flutter/material.dart';

/*
burada anımal sınıfın customu olusturuldu  ve burda  ona aıt ozellıklerın ne olması
gerektıgı yazıldı

*/
class AnimalDetailWidget extends StatelessWidget {
  const AnimalDetailWidget({
    super.key,
    required this.ciftlikNo,
    required this.grup,
    required this.jinek,
  });

  final String ciftlikNo;
  final String grup;
  final String jinek;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
