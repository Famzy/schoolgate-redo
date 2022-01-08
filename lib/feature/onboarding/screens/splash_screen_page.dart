import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:schoolgate/feature/onboarding/screens/on_boarding_page.dart';
import 'package:schoolgate/utils/assets.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';
import 'package:schoolgate/utils/utils.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () => context.push(
        const OnBoardingPage()
      )
    );
    return
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: primaryBlack,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const RiveAnimation.asset(
          RiveAssets.splashRive1,
        ),
      ),
    );
  }
  
}

// class _SplashScreenState extends State<SplashScreen> {
//
//   final _controller = Get.put(HomeController());
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Timer(const Duration(seconds: 5),() => Get.off(() =>
//     _controller.loggedin.value ?
//     (_controller.authResponse!.value.user!.usertype == "student"
//         ? LandingPage(response: _controller.authResponse!.value)
//         : _controller.authResponse!.value.user!.usertype == "extradrive"
//         ? ExtraDriveLandingPage(response: _controller.authResponse!.value)
//         : CreatorLandingPage(_controller.authResponse!.value))
//
//         : OnBoardingPage()));
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Container(
//         color: primaryBlack,
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: RiveAnimation.asset(
//           AssetsPath.SplashRive1,
//         ),
//       ),
//     );
//   }
// }


