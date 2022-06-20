import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          const Icon(
            Icons.bubble_chart_outlined,
            size: 50,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'S&M Accesorios',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'by MrCajuka',
                style: TextStyle(color: Colors.white, fontSize: 8),
              ),
            ],
          )
        ],
      ),
    );
  }
}
