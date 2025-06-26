import 'package:flutter/material.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/Google_Maps/show_ngo_directions.dart';
import 'package:giftit/views/auth/login/login_main_screen.dart';
import 'package:giftit/views/auth/otp/otp_main_screen.dart';
import 'package:giftit/views/auth/signup/signup_main.dart';
import 'package:giftit/views/ngo_Description/ngo_description.dart';
import 'package:giftit/views/post_createdialog/post_dialog.dart';
import 'package:giftit/views/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:giftit/views/post_form/post_form.dart';
import 'package:giftit/views/widgets/dummy_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar());
      case RoutesNames.onBoarding:
        return MaterialPageRoute(
            builder: (BuildContext context) => DummyScreen());
      case RoutesNames.dummy:
        return MaterialPageRoute(
            builder: (BuildContext context) => DummyScreen());
      case RoutesNames.createPost:
        return MaterialPageRoute(
            builder: (BuildContext context) => Postcreationdialog());
      case RoutesNames.postForm:
        return MaterialPageRoute(
            builder: (BuildContext context) => PostForm());
      case RoutesNames.showGoogleMap:
        return MaterialPageRoute(
            builder: (BuildContext context) => ShowNgoDirections());
      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignupMainScreen());
      case RoutesNames.otp:
        return MaterialPageRoute(
            builder: (BuildContext context) => OtpMainScreen(
                  email: "kranthivarma74@gmail.com",
                ));
      case RoutesNames.ngoDescrip:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) => NgoDescription(
                  ngo: args['ngo'],
                ));
      case RoutesNames.postCreateDialog:
        return MaterialPageRoute(
            builder: (BuildContext context) => Postcreationdialog());
      default:
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
