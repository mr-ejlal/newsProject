import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newsproject/api_service/api_services.dart';
import 'package:newsproject/model/home_screen.dart';

class HomeScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();
  RxList<BlogsCategory> categoryData = <BlogsCategory>[].obs;
  RxList<Result> result = <Result>[].obs;
  RxInt count = 0.obs;
  RxString next = "".obs;
  RxString previous = "".obs;
  Rx<TabController>? tabController;
  RxList<ModelForTabBar> tabBarData = <ModelForTabBar>[].obs;
  @override
  void onInit() {
    super.onInit();
    // getBlogCategory();
    // getBlogBody();
    getCategory();
  }

  getCategory() async {
    GetCategorytResponseModel data = await ApiService.getCategory();
    tabBarData.clear();
    data.blogsCategory?.forEach((element) async {
      GetCategoryDatatResponseModel data =
          await ApiService.getCategoryData(element.id ?? 10);
      tabBarData.add(ModelForTabBar(
          header: element.name ?? "", result: data.results ?? <Result>[]));
    });
  }

  // getBlogBody() async {
  //   BlogBodyModel data = await ApiService.blogBody(categoryId: 0);
  //   result.value = data.results ?? <Result>[];
  //   count.value = data.count ?? 0;
  //   next.value = data.next ?? "";
  //   previous.value = data.previous ?? "";
  // }
}
