import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonOverlay extends StatelessWidget {
  const BackButtonOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 6, left: 4),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: const Color(0xFF33343D),
              elevation: 6,
              shape: const CircleBorder(),
            ),
            child: const Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
