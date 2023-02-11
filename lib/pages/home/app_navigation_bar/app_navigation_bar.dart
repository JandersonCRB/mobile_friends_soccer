import 'package:flutter/material.dart';

import '../home_controller.dart';
import 'nav_bar_item.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: Color(0xFF97ABB1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 28),
          child: SizedBox(
            height: 36,
            child: Row(
              children: const [
                Expanded(
                  child: NavBarItem(
                    icon: Icons.home_filled,
                    page: HomeControllerPage.home,
                  ),
                ),
                Expanded(
                  child: NavBarItem(
                    icon: Icons.group_add_outlined,
                    page: HomeControllerPage.add,
                  ),
                ),
                Expanded(
                  child: NavBarItem(
                    icon: Icons.insights,
                    page: HomeControllerPage.statistics,
                  ),
                ),
                Expanded(
                  child: NavBarItem(
                    icon: Icons.account_circle_outlined,
                    page: HomeControllerPage.profile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
