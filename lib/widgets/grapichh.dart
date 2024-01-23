/*
Bu sayfada bı containerın ıcıne dikey kaydırma işlevi sağlayan SingleChildScrollView eklendi
ardından  Grafik görüntüsü için AspectRatio widget'ı ekledık
 Grafik genişliği, görüntülenecek veri noktalarının uzunluğuna göre belirlenir 
 aspect ratio eklendi ve Değerlerin belirli koşullara göre metne dönüştürülmesisağlandı 
*/
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 15,
        left: 10,
      ),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(20.0),
          ),
          color: Color.fromRGBO(15, 120, 112, 1),
          boxShadow: [
            BoxShadow(spreadRadius: 1.0, blurRadius: 0.5),
          ]),
      child: SingleChildScrollView(
        // // Dikey kaydırma işlevselliği sağlayan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Grafik başlığını içeren Container widget'ı
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "Olay Adı :Kızgınlık",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            ),
            // Grafik görüntüsü için AspectRatio widget'ı
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 10,
                  bottom: 30,
                ),
                // LayoutBuilder ile grafik için yatay kaydırmayı destekleyen bir widget oluşturulur
                child: LayoutBuilder(builder: (context, constrants) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      // Grafik genişliği, görüntülenecek veri noktalarının uzunluğuna göre belirlenir
                      width: max(constrants.maxWidth,
                          (showAvg ? avgSpots : mainSpots).length * 24),
                      child: LineChart(
                        // Gösterilecek veri setine göre grafik oluşturulur
                        showAvg ? avgData() : mainData(),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Alt başlık widget'ı için metin oluşturan fonksiyon
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    Widget text;
// Değerlerin belirli koşullara göre metne dönüştürülmesi
    switch (value.toInt()) {
      case 2:
        text = const Text('2023-10-12 01:00', style: style);
        break;
      case 8:
        text = const Text('2023-10-12 01:00', style: style);
        break;
      default:
        text = const Text('2023-10-12 01:00', style: style);
        break;
    }
    // Metnin dikey olarak gösterilmesi için RotatedBox kullanılır
    Widget verticalText = RotatedBox(
      quarterTurns: 3, // Rotate text 90 degrees clockwise
      child: text,
    );
    // Yatay metnin dikey olarak gösterilmesi için SideTitleWidget kullanılır
    return SideTitleWidget(
      axisSide: AxisSide.right, // Set axisSide to vertical
      child: verticalText, // Return the rotated text
    );
  }

  // Ana veri seti için LineChartData oluşturan fonksiyon
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.blue,
            strokeWidth: 1,
          );
        },
      ),
      // Eksen başlıkları ve özellikleri
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            //   getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      // Çizgi veri setleri
      lineBarsData: [
        LineChartBarData(
          spots: mainSpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // Ortalama veri seti için LineChartData oluşturan
  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        // Yatay ve dikey izgara çizgilerinin stil ve renkleri
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      // Eksen başlıkları ve özellikleri

      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      // Grafik sınırları
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      // Çizgi veri setleri
      lineBarsData: [
        LineChartBarData(
          spots: avgSpots,
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Ortalama ve ana veri noktalarını içeren listeler
List<FlSpot> avgSpots = const [
  FlSpot(0, 3.44),
  FlSpot(2.6, 3.44),
  FlSpot(4.9, 3.44),
  FlSpot(6.8, 3.44),
  FlSpot(8, 3.44),
  FlSpot(9.5, 3.44),
  FlSpot(11, 3.44),
  FlSpot(12 + 0, 3.44),
  FlSpot(12 + 2.6, 3.44),
  FlSpot(12 + 4.9, 3.44),
  FlSpot(12 + 6.8, 3.44),
  FlSpot(12 + 8, 3.44),
  FlSpot(12 + 9.5, 3.44),
  FlSpot(12 + 11, 3.44),
  FlSpot(12 + 12 + 0, 3.44),
  FlSpot(12 + 12 + 2.6, 3.44),
  FlSpot(12 + 12 + 4.9, 3.44),
  FlSpot(12 + 12 + 6.8, 3.44),
  FlSpot(12 + 12 + 8, 3.44),
  FlSpot(12 + 12 + 9.5, 3.44),
  FlSpot(12 + 12 + 11, 3.44),
];
// Burada ana veri noktaları belirtilir

List<FlSpot> mainSpots = const [
  FlSpot(0, 3),
  FlSpot(2.6, 2),
  FlSpot(4.9, 5),
  FlSpot(6.8, 3.1),
  FlSpot(8, 4),
  FlSpot(9.5, 3),
  FlSpot(11, 4),
  FlSpot(12 + 0, 3),
  FlSpot(12 + 2.6, 2),
  FlSpot(12 + 4.9, 5),
  FlSpot(12 + 6.8, 3.1),
  FlSpot(12 + 8, 4),
  FlSpot(12 + 9.5, 3),
  FlSpot(12 + 11, 4),
  FlSpot(12 + 12 + 0, 3),
  FlSpot(12 + 12 + 2.6, 2),
  FlSpot(12 + 12 + 4.9, 5),
  FlSpot(12 + 12 + 6.8, 3.1),
  FlSpot(12 + 12 + 8, 4),
  FlSpot(12 + 12 + 9.5, 3),
  FlSpot(12 + 12 + 11, 4),
];
