import 'package:airapp/forms/forms.dart';
import 'package:airapp/home/home.dart';
import 'package:airapp/Profile/profile.dart';
import 'package:airapp/constants.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    //Forms(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
        decoration: const BoxDecoration(
          color: AppColors.blueAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: GNav(
              rippleColor: AppColors.grey[300]!,
              hoverColor: AppColors.grey[100]!,
              gap: 8,
              activeColor: AppColors.blueAccent,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.yellowAccent,
              color: AppColors.white,
              textStyle: AppTextStyles.subtitle2.copyWith(
                color: AppColors.blueAccent,
              ),
              tabBorderRadius: 10,
              tabs: const [
                GButton(
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.file,
                  text: 'Records',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      // bottomNavigationBar: FloatingNavbar(
      //   onTap: (index) => setState(() {
      //     _selectedIndex = index;
      //   }),
      //   currentIndex: _selectedIndex,
      //   items: [
      //     FloatingNavbarItem(icon: Icons.home),
      //     FloatingNavbarItem(icon: Icons.bar_chart),
      //     FloatingNavbarItem(icon: Icons.person),
      //   ],
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.white,
      //   backgroundColor: Colors.blue,
      //   itemBorderRadius: 15,
      //   borderRadius: 20,
      //   iconSize: 20,
      // ),
    );
  }
}
