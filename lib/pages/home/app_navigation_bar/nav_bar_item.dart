import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/pages/home/home_controller.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final HomeControllerPage page;

  const NavBarItem({
    Key? key,
    required this.icon,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return InkWell(
      onTap: () {
        homeController.changePage(page);
      },
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              size: 26,
              color: const Color(0xFFE6862E),
            ),
            if (homeController.currentPage.value == page)
              Container(
                height: 2,
                width: 32,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                  color: Color(0xFFE6862E),
                ),
              ),
          ],
        );
      }),
    );
  }
}
