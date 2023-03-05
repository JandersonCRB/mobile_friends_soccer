import 'package:get/get.dart';
import 'package:mobile_friends_soccer/services/championship_service.dart';

import '../../models/championship.dart';

class ChampionshipListController extends GetxController {
  final _championships = <Championship>[].obs;

  List<Championship> get championships => _championships;

  void fetchChampionships() {
    ChampionshipService().fetchChampionships().then((championships) {
      _championships.clear();
      _championships.addAll(championships);
    });
  }
}
