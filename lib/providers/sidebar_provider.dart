import 'package:flutter/cupertino.dart';

class SidebarProvider extends ChangeNotifier {
  bool _isSidebarOpen = false;

  bool get isSidebarOpen => _isSidebarOpen;

  void toggleSidebar() {
    _isSidebarOpen = !_isSidebarOpen;
    notifyListeners();
  }
}
