//burası dashboard sayfasındakı kutuların
// oldugu kısımın custom wıdgetı saayıların konumu kutunun
//seklını vermıs oluyor
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/dashboard_model.dart';

class DashboardContainer extends StatelessWidget {
  final DashboardContainerModel model;
  // DashboardContainer sınıfı, DashboardContainerModel türünden bir 'model' alır.
  // 'model' parametresi zorunlu olarak gereklidir
  const DashboardContainer({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20.0),
          ),
          color: Color.fromRGBO(15, 120, 112, 1),
          boxShadow: [
            BoxShadow(spreadRadius: 1.0, blurRadius: 0.5),
          ]),
      child: Column(
        //burdaarka plandakı resım   ekr
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              model.image,
              width: 20,
              height: 15,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          //modeln yazısı
          Text(
            model.text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '${model.count}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
