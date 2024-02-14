import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IndividualBar {
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y});
}

Widget getTitleWidget(double value, TitleMeta meta) {
  const style = TextStyle(
      fontSize: 12, color: Colors.blueGrey, fontWeight: FontWeight.bold);
  Widget text;
  switch (value) {
    case 0:
      text = const Text(
        'Sun',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'Mon',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'Tue',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'Wed',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'Thu',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'Fri',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'Sat',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(
      child: SizedBox(
        height: 30,
        child: text,
      ),
      axisSide: meta.axisSide);
}
