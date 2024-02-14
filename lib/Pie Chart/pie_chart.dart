import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartView extends StatefulWidget {
  @override
  State<PieChartView> createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView> {
  var selectedPercentage = "";

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    List<PieChartSectionData> pieChartSectionData = [
      PieChartSectionData(
        value: 20,
        titleStyle: style,
        title: "",
        badgeWidget: const Text(
          "Grocery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        color: const Color(0xffed733f),
      ),
      PieChartSectionData(
        value: 35,
        titleStyle: style,
        title: "",
        badgeWidget: const Text(
          "Loan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        color: const Color(0xff584f84),
      ),
      PieChartSectionData(
        value: 15,
        titleStyle: style,
        title: "",
        badgeWidget: const Text(
          "Veg",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        color: const Color(0xffd86f9b),
      ),
      PieChartSectionData(
        value: 30,
        titleStyle: style,
        title: "",
        badgeWidget: const Text(
          "Savings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        color: const Color(0xffa2663e),
      ),
    ];
    return Stack(alignment: Alignment.center, children: [
      PieChart(
        PieChartData(
          sectionsSpace: 4,
          centerSpaceColor: Colors.brown.shade50,
          centerSpaceRadius: 70,
          sections: pieChartSectionData,
          pieTouchData: PieTouchData(
            touchCallback: (p0, p1) {
              var sectionData =
                  p1?.touchedSection?.props[0] as PieChartSectionData?;
              var text = (sectionData?.badgeWidget as Text?)?.data;
              setState(() {
                selectedPercentage =
                    "$text: ${sectionData?.value.ceilToDouble()}%";
              });
            },
          ),
        ),
        swapAnimationDuration: const Duration(seconds: 3),
        swapAnimationCurve: Curves.bounceIn,
      ),
      Text(
        selectedPercentage,
        style: TextStyle(
          color: Colors.green.shade800,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }
}
