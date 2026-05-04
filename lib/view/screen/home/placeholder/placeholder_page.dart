import 'dart:ui';

import 'package:agin_3/constans/widgets.dart';
import 'package:agin_3/view/screen/home/notifications/notification_page.dart';
import 'package:agin_3/view/screen/home/profile/profile_page.dart';
import 'package:flutter/material.dart';

class PlaceholderPage extends StatelessWidget {
  final int tabIndex; // 1 or 2 for now
  final String title;

  const PlaceholderPage({
    super.key,
    required this.tabIndex,
    required this.title,
  });

  void _onNavTap(BuildContext context, int index) {
    if (index == tabIndex) return;

    switch (index) {
      case 0:
        // Home icon => open placeholder "Home" screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const PlaceholderPage(tabIndex: 0, title: 'Home'),
          ),
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) =>
                const PlaceholderPage(tabIndex: 1, title: 'Calendar'),
          ),
        );
        break;
      case 2:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const NotificationPage()),
        );
        break;
      case 3:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF3F3F3);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text(
          'Placeholder Screen',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: tabIndex,
        onTabSelected: (index) => _onNavTap(context, index),
      ),
    );
  }
}