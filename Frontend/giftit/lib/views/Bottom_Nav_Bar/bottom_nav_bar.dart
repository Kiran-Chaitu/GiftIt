import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giftit/bloc/bottom_bar_cubit.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/NGO/ngo_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> screens = [
    NgoScreen(),
    NgoScreen(),
    NgoScreen(),
    NgoScreen(),
  ];
  final List<IconData> icons = const [
    Icons.home,
    Icons.apartment,
    Icons.notifications,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<BottomBarCubit, int>(builder: (context, currentIndex) {
        return IndexedStack(
          index: currentIndex,
          children: screens,
        );
        // return Center(child: Text('Hi'));
      }),
      bottomNavigationBar: BlocBuilder<BottomBarCubit, int>(
        builder: (context, currentIndex) {
          return AnimatedBottomNavigationBar(
            splashColor: Colors.transparent,
            splashRadius: 0,
            activeColor: Colors.white,
            iconSize: 26,
            backgroundColor: AppColors.primaryGreen,
            icons: icons,
            activeIndex: currentIndex,
            onTap: (index) {
              context.read<BottomBarCubit>().changeIndex(index);
            },
            notchSmoothness: NotchSmoothness.smoothEdge,
            gapLocation: GapLocation.center,
            // leftCornerRadius: 12,
            // rightCornerRadius: 12,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, RoutesNames.dummy);
        },
        backgroundColor: AppColors.darkGreen,
        mini: false,
        child: FaIcon(
          FontAwesomeIcons.circlePlus,
          size: 40,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
