import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_test/counter/counter_page.dart';
import 'package:clean_architecture_test/home/home_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: CounterPage)
  ],
)
class $AppRouter {}
