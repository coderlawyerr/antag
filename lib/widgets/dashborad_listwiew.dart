/*
dashboard sayfasındakı yazıları regını ve boyutunu ayarlıyoruz
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/listwiew_model.dart';

class CustomListView extends StatelessWidget {
  final List<DashboardDetailModel> data;
  const CustomListView({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          //veriler yazılar ve rakamlar  rowlandı  ve bırıncı rakamlar kırmızı  yazılar sıyah olarak ayarlandı
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data[index].text1,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  data[index].text2,
                  style: const TextStyle(fontSize: 25, color: Colors.red),
                ),
              ],
            ),
            // çizgi eklenmesı ıcın
            const Divider(),
          ],
        );
      },
    );
  }
}
