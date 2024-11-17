import 'package:ebook_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _LottiePageState();
}

class _LottiePageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        //Get.off(const NavBarWidget());
        Navigator.pushReplacementNamed(context, RouteNames.navBar);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lotties/animation.json",
            controller: controller, onLoaded: (composition) {
          controller.forward();
        }),
      ),
    );
  }
}
