import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyect_sm_accesorios/ui/cards/index.dart';
import 'package:proyect_sm_accesorios/ui/charts/chart.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  WhiteCard(
                    title: 'Estadísticas',
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        children: const [
                          CustomCardItem(
                            color: Colors.blue,
                            child: Text(
                              '10',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CustomCardItem(
                            color: Colors.red,
                            child: Text(
                              '10',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CustomCardItem(
                            color: Colors.orange,
                            child: Text(
                              '10',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          CustomCardItem(
                            color: Colors.green,
                            child: Text(
                              '10',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Chart(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Producto más vendido",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/img/no-image.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Column(
                        children: [
                          const Text('Nombre producto'),
                          Text(
                            NumberFormat.currency(
                                    locale: 'es-cl',
                                    decimalDigits: 0,
                                    symbol: 'CLP')
                                .format(1000),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Otros productos",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const ProdcutInfoCard(
                      title: "Nombre producto",
                      count: 20,
                      price: 1328,
                    ),
                    const ProdcutInfoCard(
                      title: "Nombre producto",
                      count: 20,
                      price: 1328,
                    ),
                    const ProdcutInfoCard(
                      title: "Nombre producto",
                      count: 20,
                      price: 1328,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
