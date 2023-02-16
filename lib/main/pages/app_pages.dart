import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:twake/feature/authorization/splash/presentation/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: SplashPage.routeName,
      page: () => const SplashPage(),
    )
  ];

}
