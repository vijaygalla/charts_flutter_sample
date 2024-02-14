import 'package:charts_sample_app/Bar Chart/bar_chart.dart';
import 'package:charts_sample_app/Line%20Chart/line_chart.dart';
import 'package:charts_sample_app/Pie%20Chart/pie_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ChartView(),
  ));
}

class ChartView extends StatelessWidget {
  ChartView({super.key});

  //List of expenses weekly
  final List<double> weeklySummary = [
    4.40,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text(
          "Charts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff584f84),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: BarChartView(weeklySummary: weeklySummary),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 200,
                child: LineChartView(weeklySummary: weeklySummary),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 200,
                child: PieChartView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
