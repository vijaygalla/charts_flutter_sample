import 'package:charts_sample_app/Bar Chart/bar_data.dart';
import 'package:charts_sample_app/Bar%20Chart/individual_bar_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartView extends StatelessWidget {
  final List<double> weeklySummary;
  BarChartView({required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
        sun: weeklySummary[0],
        mon: weeklySummary[1],
        tue: weeklySummary[2],
        wed: weeklySummary[3],
        thu: weeklySummary[4],
        fri: weeklySummary[5],
        sat: weeklySummary[6]);
    barData.initializeBarData();
    return BarChart(
      BarChartData(
        backgroundColor: Colors.brown.shade50,
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getTitleWidget),
          ),
        ),
        barGroups: barData.barData
            .map(
              (data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                  toY: data.y,
                  borderRadius: BorderRadius.circular(2),
                  width: 20,
                  color: data.y <= 50.0
                      ? Colors.green.shade300
                      : Colors.deepOrange.shade300,
                  backDrawRodData: BackgroundBarChartRodData(
                      toY: 100, show: true, color: Colors.blueGrey.shade50),
                )
              ]),
            )
            .toList(),
      ),
    );
  }
}
