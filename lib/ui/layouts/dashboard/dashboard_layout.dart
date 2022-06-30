import 'package:flutter/material.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';
import 'package:proyect_sm_accesorios/ui/shared/index.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SidebarProvider.menuController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

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
                      child: widget.child,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
              animation: SidebarProvider.menuController,
              builder: (context, _) {
                return Stack(
                  children: [
                    if (SidebarProvider.isOpen)
                      Opacity(
                        opacity: SidebarProvider.opacity.value,
                        child: GestureDetector(
                          onTap: SidebarProvider.closeMenu,
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    Transform.translate(
                      offset: Offset(SidebarProvider.movement.value, 0),
                      child: const Sidebar(),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}
