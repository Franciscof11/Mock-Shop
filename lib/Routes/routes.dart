import 'package:get/get.dart';

import '../Home_page/Page/home_page.dart';

class RoutesClass {
  static String homePage = '/';
  static String productDatailsPage = '/productDatailsPage';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => HomeView()),
    GetPage(name: '/productDatailsPage', page: () => HomeView()),
  ];
}
