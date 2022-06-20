import 'package:fluro/fluro.dart';

import 'package:proyect_sm_accesorios/ui/views/not_page_found_view.dart';

class NotPageFoundHandler {
  static Handler notFoundHandler = Handler(
    handlerFunc: (context, parameters) => const NotPageFoundView(),
  );
}
