import 'package:flutter/material.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/ngo_Description/ngo_description.dart';
import 'package:giftit/views/post_createdialog/post_dialog.dart';
import 'package:giftit/views/Bottom_Nav_Bar/bottom_nav_bar.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar());
      case RoutesNames.postCreateDialog:
        return MaterialPageRoute(
            builder: (BuildContext context) => Postcreationdialog());      
      case RoutesNames.ngoDescrip:
        return MaterialPageRoute(
            builder: (BuildContext context) => NgoDescription());      
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
