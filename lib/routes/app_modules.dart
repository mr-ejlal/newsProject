import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:newsproject/controller/news_screen_controller.dart';
import 'package:newsproject/routes/routes.dart';
import 'package:newsproject/view/news_screen.dart';

import '../controller/home_screen.dart';
import '../view/home_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = <GetPage>[
    GetPage(
        name: homeScreenRoute,
        page: () => const HomeScreenView(),
        binding: HomeScreenControllerBinding()),
    // GetPage(
    //     name: newsScreenRoute,
    //     page: () => NewwScreen(),
    //     binding: NewsScreenControllerBinding()),
  ];
}
