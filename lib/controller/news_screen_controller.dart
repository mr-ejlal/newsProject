import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newsproject/model/home_screen.dart';

class NewsScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsScreenController());
  }
}

class NewsScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    item = Get.arguments ?? <Result>[];
  }

  static NewsScreenController get to => Get.find();

  List<Result> item = <Result>[];
}
