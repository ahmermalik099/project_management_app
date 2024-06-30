import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_management_app/projects/projects_screen.dart';
import 'package:project_management_app/settings/settings_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../HomePage/homepage_screen.dart';




class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: HomeScreen(),
            ),
            Container(
              alignment: Alignment.center,
              child: ProjectScreen(),
            ),
            Container(
              alignment: Alignment.center,
              child: SettingsScreen(),
            ),

          ],
        ),
        bottomNavigationBar: WaterDropNavBar(
          backgroundColor: navigationBarColor,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          selectedIndex: selectedIndex,
          barItems: <BarItem>[
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_rounded,
            ),
            BarItem(
                filledIcon: Icons.list,
                outlinedIcon: Icons.list_rounded),
            BarItem(
              filledIcon: Icons.settings,
              outlinedIcon: Icons.settings_rounded,
            ),

          ],
        ),
      ),
    );
  }
}