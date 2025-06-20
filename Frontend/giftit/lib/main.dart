import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:giftit/bloc/NGO/ngo_bloc.dart';
import 'package:giftit/bloc/authe/signup/signup_main_bloc.dart';
import 'package:giftit/bloc/bottom_bar_cubit.dart';
import 'package:giftit/bloc/authe/login_bloc/login_main_bloc.dart';
import 'package:giftit/bloc/ngo_descri_bloc.dart/ngo_desc_main_bloc.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/routes/routes.dart';
import 'package:giftit/configs/themes/app_theme.dart';
import 'package:giftit/controller/internet_connectivity_checker.dart';
import 'package:giftit/repository/ngo_repository.dart';

void main() async {
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
            BlocProvider(create: (_) => BottomBarCubit()),
            BlocProvider(create: (_) => NgoBloc(repository: NGORepository())),
            BlocProvider(create: (_)=>LoginBloc()),
            BlocProvider(create: (_)=>NgoDescBloc(repository: NGORepository())),
            BlocProvider(create: (_)=>SignupMainBloc()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
            initialRoute: RoutesNames.ngoDescrip,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}
