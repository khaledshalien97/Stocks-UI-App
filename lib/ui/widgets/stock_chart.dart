import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StockChart extends StatelessWidget {
  final List<FlSpot> data;

  const StockChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final double minX = data.first.x;
    final double maxX = data.last.x;
    final double minY = data.map((e) => e.y).reduce(min);
    final double maxY = data.map((e) => e.y).reduce(max);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          //  color: Colors.deepPurple.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChart(
            LineChartData(
              backgroundColor: Colors.black,
              minX: minX,
              maxX: maxX,
              minY: minY - 2,
              maxY: maxY + 2,
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(0.4),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: FlDotData(show: false),
                  spots: data,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
