import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomBarCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        initialRoute: RoutesNames.home,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
