import 'package:agin_3/controller/controlleBetweentabs.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ApartmentsScreen extends StatefulWidget {
  const ApartmentsScreen({super.key});

  @override
  State<ApartmentsScreen> createState() => _ApartmentsScreenState();
}

final List<String> images = [
  'images/home1.jpg',
  'images/home2.jpg',
  'images/home3.jpg',
  'images/home4.jpg',
  'images/home5.jpg',
];

class _ApartmentsScreenState extends State<ApartmentsScreen> {
  int currentIndex = 0;
  Timer? sliderTimer;
  @override
  void initState() {
    super.initState();
    sliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        if (currentIndex < images.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    sliderTimer?.cancel(); // إيقاف التايمر عند إغلاق الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// الصورة الكبيرة
              Container(
                padding: EdgeInsets.all(20),
                height: 280,
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(images[currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // شريط للنقط
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (i) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == i ? Colors.white : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: const Color.fromARGB(255, 20, 49, 92),
                      ),
                      Text(
                        "Lorem ipsum dolor ",
                        style: TextStyle(
                          fontSize: 17,
                          color: const Color.fromARGB(255, 11, 53, 87),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.text_format_rounded,
                        color: const Color.fromARGB(255, 9, 46, 11),
                      ),
                      Text("Rate . 2004  ", style: TextStyle(fontSize: 15)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          Icon(Icons.star, color: Colors.amber, size: 18),
                        ],
                      ),
                    ],
                  ),
                  //****************** */
                  SizedBox(height: 10),

                  //Controll for pages
                  ControllebetweenTabs(),

                  //
                  // SizedBox(height: 5),
                  //++
                ],
              ),

              Container(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
