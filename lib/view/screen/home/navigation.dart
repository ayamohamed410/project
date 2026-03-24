import 'package:agin_3/constans/colors.dart';
import 'package:agin_3/view/screen/home/profile.dart';
import 'package:agin_3/view/screen/home/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'favorite.dart';
import 'home.dart';

class Navigation extends StatefulWidget {
  Navigation({super.key});

  static String routeName = 'navigation';

  @override
  State<Navigation> createState() => _Navigation();
}

class _Navigation extends State<Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Favorite(),
    Search(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.primary,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.primary,
        items: const <Widget>[
          Icon(Icons.home_rounded, size: 30, color: Colors.white),
          Icon(Icons.favorite_border, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
// return Scaffold(
// bottomNavigationBar: CustomBottomBar(
// currentIndex: currentIndex,
// onTabSelected: (index) {
// setState(() => currentIndex = index);
// },
// ),
// body: SingleChildScrollView(
// child: Column(
// children: [
// Stack(
// children: [
// Container(
// width: double.infinity,
// height: MediaQuery.of(context).size.height * .2,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(0),
// topLeft: Radius.circular(0),
// bottomRight: Radius.circular(64),
// bottomLeft: Radius.circular(64),
// ),
// color: AppColors.primary,
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// );
