import 'package:charts_sample_app/Bar Chart/bar_data.dart';
import 'package:charts_sample_app/Bar%20Chart/individual_bar_data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartView extends StatelessWidget {
  final List<double> weeklySummary;
  LineChartView({required this.weeklySummary});

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
    return LineChart(
      LineChartData(
        backgroundColor: Colors.brown.shade50,
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: true,
        ),
        maxY: 100,
        minY: 0,
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles:
                SideTitles(showTitles: true, getTitlesWidget: getTitleWidget),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: barData.barData
                .map((data) => FlSpot(double.parse(data.x.toString()), data.y))
                .toList(),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
