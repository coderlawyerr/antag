/*
Bu sayfada 
 dash boardContainer.dart sınıfından alttakı kutular çağırldı yani
 custom wıdget olusturuldu
  sonra dashboardlistwiew custom wıdget 
  olusturuldu yıne çağırma işlemı yapıldı.

*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/simple_data.dart';
import 'package:flutter_application_1/screen/angerlist.dart';
import 'package:flutter_application_1/widgets/dashboardContainer.dart';
import 'package:flutter_application_1/widgets/dashborad_listwiew.dart';

import '../service/login_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.teal.shade200.withOpacity(0.5),
          title: const Text("Dashboard"),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 0.757),
              Color.fromRGBO(12, 99, 86, 0.757),
            ],
          ),

          ///arka plana resim ekelendi
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.scaleDown,
          ),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade200.withOpacity(0.5),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ///bu kısımda listwiew geliyor
                      //CustomListView(data: dashboardDetailModel),
                      const SizedBox(height: 20),

                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                        children:
                            List.generate(dashboardContainers.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                //dashboard custom cagırııp burda kutular geliyor
                                if (dashboardContainers[index].text ==
                                    'Servise Hazır') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AngarList(),
                                    ),
                                  );
                                }
                              },
                              child:
                                  SizedBox(), /* DashboardContainer(
                                model: dashboardContainers[index],
                              ), */
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 30), // İhtiyaca göre ayarlanabilir
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
