import 'package:fluro/fluro.dart';

import 'package:provider/provider.dart';

import 'package:proyect_sm_accesorios/providers/index.dart';

import 'package:proyect_sm_accesorios/ui/views/index.dart';

class NotPageFoundHandler {
  static Handler notFoundHandler = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SidebarProvider>(context!, listen: false)
          .setCurrentPage('/404');
      return const NotPageFoundView();
    },
  );
}
