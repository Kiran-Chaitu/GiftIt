import 'package:flutter/material.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/Google_Maps/show_ngo_directions.dart';
import 'package:giftit/views/auth/Reset_password/reset_pswd_mian_screen.dart';
import 'package:giftit/views/auth/change_pswd_screens_floder/old_psswd_screens_folder/old_pswd_main_screen.dart';
import 'package:giftit/views/auth/forget_password/email_forget_pwd_folder/email_fp_main_screen.dart';
import 'package:giftit/views/auth/login/login_main_screen.dart';
import 'package:giftit/views/auth/otp/otp_main_screen.dart';
import 'package:giftit/views/auth/signup/signup_main.dart';
import 'package:giftit/views/ngo_Description/ngo_description.dart';
import 'package:giftit/views/post_createdialog/post_dialog.dart';
import 'package:giftit/views/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:giftit/views/post_form/post_form.dart';
import 'package:giftit/views/widgets/dummy_screen.dart';
import '../../views/Profile/change_password.dart';
import '../../views/Profile/donation_history.dart';
import '../../views/Profile/edit_profile.dart';
import '../../views/Profile/logout.dart';
import '../../views/Profile/ngo_vlounteer.dart';


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
      case RoutesNames.editProfile:
        final args = settings.arguments as Map<String, dynamic>;
        
        return MaterialPageRoute(
            builder: (BuildContext context) => EditProfilePage(
              profileModel:  args['profileModel']
            ));
      case RoutesNames.donationHistory:
        return MaterialPageRoute(
            builder: (BuildContext context) => DonationHistoryPage());
      case RoutesNames.ngoVolunteer:
        return MaterialPageRoute(
            builder: (BuildContext context) => NgoVlounteerPage());
      case RoutesNames.changePassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => ChangePasswordPage());
      case RoutesNames.logout:
        return MaterialPageRoute(
            builder: (BuildContext context) => LogoutPage());
      case RoutesNames.otp:
        final args = settings.arguments as  Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => OtpMainScreen(email: args['email']!, type:  args['type']!,),
        );
      case RoutesNames.ngoDescrip:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (BuildContext context) => NgoDescription(
                  ngo: args['ngo'],
                ));
      case RoutesNames.postCreateDialog:
        return MaterialPageRoute(
            builder: (BuildContext context) => Postcreationdialog());
      
      case RoutesNames.oldPassword:
        return MaterialPageRoute(
          builder: (BuildContext context) => OldPasswordMainScreen());  
      case RoutesNames.resetpswd:
        final email =settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => ResetPasswordMainScreen(email: email));
      case RoutesNames.forgetPswdEmail:
        return MaterialPageRoute(
          builder: (BuildContext context) => EmailMainScreen());
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
