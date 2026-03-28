import 'package:agin_3/view/screen/apartments.dart';
import 'package:flutter/material.dart';

import '../../../constans/colors.dart';
import '../../../constans/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static String routeName = 'home';
  final List<Map<String, String>> rooms = [
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    {
      'image': 'assets/ROOM.webp',
      'title': 'Best Apartment',
      'location': 'GIZA',
      'price': '600LE/month',
      'oldPrice': '800LE/month',
    },
    // ممكن تضيف أكتر هنا...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0),
                      bottomRight: Radius.circular(64),
                      bottomLeft: Radius.circular(64),
                    ),
                    color: AppColors.primary,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 50),
                    AppWidgets.userHeader(
                      context: context,
                      name: 'Mostafa',
                      imageUrl: 'assets/user_image.png',
                    ),
                    AppWidgets.offerSlider(),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                itemCount: rooms.length,
                physics:
                    const NeverScrollableScrollPhysics(), // عشان scroll يكون في SingleChildScrollView
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عمودين
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7, // لتقريب الشكل من الصورة
                ),
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ApartmentsScreen(),
                        ),
                      );
                    },
                    child: AppWidgets.card(
                      context: context,
                      imagePath: room['image']!,
                      title: room['title']!,
                      location: room['location']!,
                      price: room['price']!,
                      oldPrice: room['oldPrice']!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
