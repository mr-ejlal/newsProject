import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:newsproject/api_service/api_url.dart';
import 'package:newsproject/routes/routes.dart';
import 'package:newsproject/view/news_screen.dart';

import '../controller/home_screen.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetX<HomeScreenController>(builder: (controller) {
          return DefaultTabController(
            length: controller.tabBarData.length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.sp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Text("News and Blogs"),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                TabBar(
                  tabs: controller.tabBarData
                      .map((element) => Tab(text: element.header))
                      .toList(),
                  labelColor: Colors.black,
                  isScrollable: true,
                ),
                Expanded(
                  child: TabBarView(
                      children: controller.tabBarData
                          .map((element) => SingleChildScrollView(
                                child: Column(
                                  children: element.result
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            Get.toNamed(newsScreenRoute,
                                                arguments: e);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(
                                              30.sp,
                                            ),
                                            child: Column(
                                              children: [
                                                Hero(
                                                  tag: e.image ?? "",
                                                  child: Image.network(baseUrl +
                                                      (e.image ?? "")),
                                                ),
                                                Text(e.title ?? ""),
                                                Text(e.content ?? "")
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ))
                          .toList()),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
