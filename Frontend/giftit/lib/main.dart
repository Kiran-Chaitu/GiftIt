import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:giftit/bloc/Google_Map/google_map_bloc.dart';
import 'package:giftit/bloc/NGO/ngo_bloc.dart';
import 'package:giftit/bloc/auth/otp/otp_main_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/change_passwordBloc/old_password_bloc/old_pswd_main_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/common_reset_pswd_bloc_floder/reset_pswd_main_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/forgetpassword/email_forgetpassword/email_fp_main_bloc.dart';
import 'package:giftit/bloc/auth/signup/signup_main_bloc.dart';
import 'package:giftit/bloc/bottom_bar_cubit.dart';
import 'package:giftit/bloc/auth/login_bloc/login_main_bloc.dart';
import 'package:giftit/bloc/ngo_descri_bloc.dart/ngo_desc_main_bloc.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/routes/routes.dart';
import 'package:giftit/configs/themes/app_theme.dart';
import 'package:giftit/controller/internet_connectivity_checker.dart';
import 'package:giftit/repository/authentication_repos/change_password/old_pswd_repo.dart';
import 'package:giftit/repository/authentication_repos/forget_password/email_forget_pswd_repo.dart';
import 'package:giftit/repository/authentication_repos/login_repository.dart';
import 'package:giftit/repository/authentication_repos/otp_repository.dart';
import 'package:giftit/repository/authentication_repos/reset_pswd_repo.dart';
import 'package:giftit/repository/authentication_repos/signup_repo.dart';
import 'package:giftit/repository/google_maps_repository.dart';
import 'package:giftit/repository/ngo_repository.dart';

import 'package:giftit/repository/profile_repos/profile_repository.dart';


import 'bloc/profile/profile_bloc.dart';

import 'bloc/home_screen/home_screen_bloc.dart';

void main() async {
  // final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env"); 
  Get.put(InternetConnectivityController());
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [

            BlocProvider(create: (_)=>ResetPasswordBloc(repository: ResetPswdRepo() ),),
            BlocProvider(create: (_)=>OldPasswordBloc(resetRepository: OldPswdForgetPswdRepository())),
            BlocProvider(create: (_)=>EmailFpMainBloc(repository: EmailForgetPswdRepository())),

            BlocProvider(create: (_) => BottomBarCubit()),
            BlocProvider(create: (_) => NgoBloc(repository: NGORepository())),

            BlocProvider(create: (_)=> ProfileBloc(repository: ProfileRepository()),),

            BlocProvider(create: (_)=>HomeScreenBloc(homeScreenRepository: DonationRepository()))
            BlocProvider(
                create: (_) => LoginBloc(loginRepository: LoginRepository())),
            BlocProvider(
                create: (_) =>
                    GoogleMapBloc(repository: GoogleMapsRepository())),
            BlocProvider(
                create: (_) => NgoDescBloc(repository: NGORepository())),
            BlocProvider(
                create: (_) =>
                    SignupMainBloc(signupRepository: SignupRepository())),
            BlocProvider(
                create: (_) => OtpMainBloc(otpRepository: OtpRepository())),a
            BlocProvider(
              create: (_) => PostCreationBloc(),
            ),
            BlocProvider(
              create: (_) => FoodFormBloc(),
            )

          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,

            initialRoute: RoutesNames.login,

            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}



// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final FlutterSecureStorage secureStorage = FlutterSecureStorage();
//   String? onboardingValue = await secureStorage.read(key: 'onboarding_completed');
//   if (onboardingValue == null) {
//     initScreen = 0;
//     await secureStorage.write(key: 'onboarding_completed', value: 'true');
//   } else {
//     initScreen = 1;
//   }
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MultiBlocProvider(
//           providers: [
//             BlocProvider(create: (_) => BottomBarCubit()),
//           ],
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: AppTheme.appTheme,
//             initialRoute: initScreen == 0 ? RoutesNames.onBoarding_screen1 : RoutesNames.home,
//             onGenerateRoute: Routes.generateRoute,
//           ),
//         );
//       },
//     );
//   }

