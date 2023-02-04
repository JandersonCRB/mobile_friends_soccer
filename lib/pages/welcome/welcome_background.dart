import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget? child;

  const WelcomeBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_bg.jpg'),
              fit: BoxFit.none,
              scale: 2,
              alignment: Alignment.bottomLeft,
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              // color: Colors.red,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(7.3),
                stops: [0.112, 0.278, 0.8755],
                colors: [
                  Color.fromRGBO(33, 34, 43, 0),
                  Color.fromRGBO(33, 34, 43, 0.5),
                  Color.fromRGBO(33, 34, 43, 1),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
