import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/pages/championships_list/championships_list_controller.dart';

import '../../models/championship.dart';

class ChampionshipListPage extends StatefulWidget {
  const ChampionshipListPage({super.key});

  @override
  _ChampionshipListPageState createState() => _ChampionshipListPageState();
}

class _ChampionshipListPageState extends State<ChampionshipListPage> {
  @override
  void initState() {
    super.initState();
    Get.find<ChampionshipListController>().fetchChampionships();
  }

  @override
  Widget build(BuildContext context) {
    final championshipListController = Get.find<ChampionshipListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Championship List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: championshipListController.championships.length,
                itemBuilder: (context, index) {
                  Championship championship =
                      championshipListController.championships[index];
                  return ListTile(
                    title: Text(championship.name ?? ''),
                  );
                },
              );
            }),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  print("Add Championship");
                  Get.find<ChampionshipListController>().fetchChampionships();
                },
                child: Text('Add Championship'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
