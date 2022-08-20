import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_sm_accesorios/providers/index.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          LineChart(
            LineChartData(
              minX: 0,
              maxX: getDiasDelMes().toDouble(),
              minY: 0,
              maxY: productProvider.getMayorCantidad(),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    ...productProvider
                        .getOrderByMes()
                        .map((e) => FlSpot(
                              e.createdAt.day.toDouble(),
                              e.total.toDouble(),
                            ))
                        .toList(),
                  ],
                  isCurved: true,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff23b6e6),
                      Color(0xff02d39a),
                    ],
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff23b6e6).withOpacity(0.3),
                        const Color(0xff02d39a).withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            swapAnimationCurve: Curves.linear,
            swapAnimationDuration: const Duration(milliseconds: 150),
          ),
        ],
      ),
    );
  }

  getDiasDelMes() {
    final mes = DateTime.now().month;
    switch (mes) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      case 2:
        return 28;
      default:
        return 30;
    }
  }
}
