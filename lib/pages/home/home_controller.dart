import 'package:get/get.dart';

enum HomeControllerPage { home, add, statistics, profile }

class HomeController extends GetxController {
  final currentPage = HomeControllerPage.home.obs;

  void changePage(HomeControllerPage page) {
    currentPage.value = page;
  }
}
