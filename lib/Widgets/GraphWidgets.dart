import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbancul/Constents/AppConstents.dart';

class GraphWidgets extends StatelessWidget {
  const GraphWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 415,
      height: 239.5,
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 2),
                FlSpot(2, 1.5),
                FlSpot(3, 2.5),
                FlSpot(4, 2),
                FlSpot(5, 3),
              ],
              isCurved: true,
              color: AppConstants.secondaryTextColor,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}