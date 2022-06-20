import 'package:flutter/material.dart';
import 'package:proyect_sm_accesorios/ui/shared/navbar.dart';
import 'package:proyect_sm_accesorios/ui/shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    Expanded(
                      child: child,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700) const Sidebar(),
        ],
      ),
    );
  }
}
