import 'package:flutter/material.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:giftit/views/onboarding/screen1.dart';
import 'package:giftit/views/widgets/dummy_screen.dart';
import '../../views/onboarding/screen3.dart';

import '../../views/onboarding/screen2.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.onBoarding_screen3:
        return MaterialPageRoute(builder: (BuildContext context) => Screen3());
      case RoutesNames.onBoarding_screen2:
        return MaterialPageRoute(
          builder: (BuildContext context) => Screen2());
      case RoutesNames.onBoarding_screen1:
        return MaterialPageRoute(
            builder: (BuildContext context) => Screen1());
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar());
      case RoutesNames.dummy:
        return MaterialPageRoute(
            builder: (BuildContext context) => DummyScreen());
      default :
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
