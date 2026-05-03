import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'colors.dart';
import 'text_styles.dart';

abstract class AppWidgets {
  static Widget stepCircle(String number, bool active, Color color, context) {
    return Container(
      height: MediaQuery.of(context).size.width * .08,
      width: MediaQuery.of(context).size.width * .08,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? color : Colors.white,
        border: Border.all(color: color, width: 1.5),
      ),
      child: Text(
        number,
        style: TextStyle(
          fontSize: 16,
          color: active ? Colors.white : color,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static Widget line(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .1,
      child: Divider(color: Colors.black, thickness: 1.5),
    );
  }

  static Widget textField({required context, required String label}) {
    return SizedBox(
      width: double.infinity, // <-- TextField width
      height: MediaQuery.of(context).size.height * .06, // <-- TextField height
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          labelText: label,
        ),
      ),
    );
  }

  static Widget passwordField({
    required context,
    required String label,
    required bool obscure,
    required Function func,
  }) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .06,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          labelText: label,
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () => func(),
          ),
        ),
      ),
    );
  }

  static Widget button({
    required BuildContext context,
    required String text,
    required VoidCallback func,
  }) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        onPressed: func,
        child: Text(text, style: AppStyles.buttonText),
      ),
    );
  }

  static Widget pin(context) {
    final Color borderColor = AppColors.primary;
    final defaultPinTheme = PinTheme(
      height: MediaQuery.of(context).size.width * .15,
      width: MediaQuery.of(context).size.width * .15,
      textStyle: TextStyle(
        fontSize: 30,
        color: borderColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    return Pinput(
      length: 4,
      separatorBuilder: (index) =>
          SizedBox(width: MediaQuery.of(context).size.width * .08),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onCompleted: (value) {
        debugPrint('Entered OTP: $value');
      },
    );
  }

  static Widget userHeader({
    required String name,
    required String imageUrl,
    required context,
    VoidCallback? onNotificationTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(imageUrl),
                  ),
                ),
                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, $name",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color:
                            Colors.white, // لو الخلفية داكنة، غيرها حسب تصميمك
                      ),
                    ),
                    const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),

            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onNotificationTap,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.2),
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget offerSlider() {
    int currentIndex = 0;

    final List<Map<String, String>> offers = [
      {
        'image': 'assets/image.webp',
        'title': 'The Best Apartment For Your College',
      },
      {'image': 'assets/image.webp', 'title': 'Luxury Studio Near Downtown'},
      {
        'image': 'assets/image.webp',
        'title': 'Modern Apartment With Great View',
      },
    ];

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: offers.length,
              itemBuilder: (context, index, realIndex) {
                final offer = offers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(2, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                          left: 16,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            offer['image']!,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer['title']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2D3E5E),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 6,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Booking Now",
                                    style: AppStyles.buttonText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 130,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  setState(() => currentIndex = index);
                },
              ),
            ),

            // Dots indicator
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: offers.asMap().entries.map((entry) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == entry.key
                        ? const Color(0xFF2D3E5E)
                        : Colors.grey.shade400,
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  static Widget card({
    required context,
    required String imagePath,
    required String title,
    required String location,
    required String price,
    required String oldPrice,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.15,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(title, style: AppStyles.titleStyle)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: AppColors.primary, size: 25),
              const SizedBox(width: 4),
              Text(
                location,
                style: AppStyles.buttonText.copyWith(color: AppColors.primary),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 1.5, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: AppColors.primary,
                  child: Center(
                    child: Text('Booking Now', style: AppStyles.buttonText),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomBar({
    required this.currentIndex,
    required this.onTabSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final totalTabs = 4;
    final tabWidth = width / totalTabs;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 90,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(width, 90),
              painter: _BottomBarPainter(currentIndex.toDouble(), tabWidth),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(totalTabs, (index) {
                    if (index == currentIndex) return const SizedBox(width: 60);
                    final icon = _getIcon(index);
                    return GestureDetector(
                      onTap: () => onTabSelected(index),
                      child: Icon(icon, color: Colors.white, size: 28),
                    );
                  }),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              bottom: 50,
              left: tabWidth * currentIndex + (tabWidth - 60) / 2,
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E3C5D),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  _getIcon(currentIndex),
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_rounded;
      case 1:
        return Icons.favorite_border;
      case 2:
        return Icons.search;
      case 3:
        return Icons.person_outline;
      default:
        return Icons.home_rounded;
    }
  }
}

class _BottomBarPainter extends CustomPainter {
  final double progress;
  final double tabWidth;

  _BottomBarPainter(this.progress, this.tabWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2E3C5D)
      ..style = PaintingStyle.fill;

    final notchCenter = (progress + 0.5) * tabWidth;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(notchCenter - 60, 0);
    path.cubicTo(
      notchCenter - 40,
      0,
      notchCenter - 35,
      30,
      notchCenter - 20,
      40,
    );
    path.arcToPoint(
      Offset(notchCenter + 20, 40),
      radius: const Radius.circular(45),
      clockwise: false,
    );
    path.cubicTo(
      notchCenter + 35,
      30,
      notchCenter + 40,
      0,
      notchCenter + 60,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 90);
    path.lineTo(0, 90);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BottomBarPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class RoomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final String oldPrice;

  const RoomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // النصوص والمعلومات
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lorem ipsum dolor",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.blue, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // الأسعار
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // زر الحجز + أيقونة القلب
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D2D50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Booking Now"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
//   void handleTap(PointerDownEvent pointerDownEvent) {
//     // Get input focus
//     _keyboardFocusNode.requestFocus(); // Works fine

//     print("In callback"); // Prints fine

//     // Bring up keyboard 
//     SystemChannels.textInput.invokeMethod('TextInput.show'); // Nothing happens
// }
}
