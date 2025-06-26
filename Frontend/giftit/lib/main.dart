import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/bloc/bottom_bar_cubit.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/routes/routes.dart';
import 'package:giftit/configs/themes/app_theme.dart';

void main() {
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
            BlocProvider(create: (_) => BottomBarCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            // initialRoute: RoutesNames.home,
            initialRoute: RoutesNames.onBoarding_screen1,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:giftit/bloc/bottom_bar_cubit.dart';
// import 'package:giftit/configs/routes/route_names.dart';
// import 'package:giftit/configs/routes/routes.dart';
// import 'package:giftit/configs/themes/app_theme.dart';
//
// int? initScreen;
//
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
// }
