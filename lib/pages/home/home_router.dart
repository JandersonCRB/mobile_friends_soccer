import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/pages/add/add.dart';
import 'package:mobile_friends_soccer/pages/home/home_controller.dart';
import 'package:mobile_friends_soccer/pages/profile/profile.dart';
import 'package:mobile_friends_soccer/pages/statistics/statistics.dart';

import '../championships_list/championships_list.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Obx(() {
      switch (homeController.currentPage.value) {
        case HomeControllerPage.home:
          return const ChampionshipListPage();
        case HomeControllerPage.add:
          return const AddPage();
        case HomeControllerPage.statistics:
          return const StatisticsPage();
        case HomeControllerPage.profile:
          return const ProfilePage();
        default:
          return const Placeholder();
      }
    });
  }
}
