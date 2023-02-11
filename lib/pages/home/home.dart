import 'package:flutter/material.dart';
import 'package:mobile_friends_soccer/pages/home/app_navigation_bar/app_navigation_bar.dart';

import 'home_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF21222B),
      body: Column(
        children: const [
          Expanded(
            child: HomeRouter(),
          ),
          AppNavigationBar(),
        ],
      ),
    );
  }
}
