import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app_ui_design/ui/widgets/appbar_widget.dart';
import 'package:stocks_app_ui_design/ui/widgets/stock_chart.dart';

class StockChartScreen extends StatefulWidget {
  const StockChartScreen({super.key});

  @override
  State<StockChartScreen> createState() => _StockChartScreenState();
}

class _StockChartScreenState extends State<StockChartScreen> {
  String selectedFilter = 'D';

  List<FlSpot> get chartData {
    switch (selectedFilter) {
      case 'M':
        return List.generate(
          30,
          (i) => FlSpot(i.toDouble(), 90 + Random().nextDouble() * 20),
        );
      case 'Y':
        return List.generate(
          365,
          (i) => FlSpot(i.toDouble(), 80 + Random().nextDouble() * 40),
        );
      default:
        return List.generate(
          7,
          (i) => FlSpot(i.toDouble(), 100 + Random().nextDouble() * 10),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            AppbarWidget(),
            const SizedBox(height: 24),
            Expanded(child: StockChart(data: chartData)),
            const SizedBox(height: 24),
            Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(30),
                isSelected: [
                  'D',
                  'M',
                  'Y',
                ].map((e) => e == selectedFilter).toList(),
                onPressed: (index) {
                  setState(() {
                    selectedFilter = ['D', 'M', 'Y'][index];
                  });
                },
                selectedColor: Colors.black,
                fillColor: Colors.orangeAccent,
                color: Colors.white,
                constraints: const BoxConstraints(minWidth: 60, minHeight: 40),
                children: const [Text('D'), Text('M'), Text('Y')],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
