import 'package:agin_3/controller/controlleBetweentabs.dart';
import 'package:agin_3/view/card/card.dart';
import 'package:agin_3/view/screen/apartments.dart';
import 'package:flutter/material.dart';

import '../../../constans/colors.dart';
import '../../../constans/widgets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static String routeName = 'home';

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
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Recommended Property",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        List.generate //لو عندى ودجت بكررها اكثر من مره  وتقبل عد مرات التكرار length
                        (card.length, (index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: SizedBox(
                              width: 200,
                              child: CardComponent(
                                image: card[index]["image"],
                                number_of_individuals:
                                    card[index]['number_of_individuals'],
                                icon: card[index]['icon'],
                                price: card[index]["price"],
                                beds: card[index]["beds"],
                                chair: card[index]["chair"],
                                table: card[index]["table"],
                              ),
                            ),
                          );
                        }),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Nearby Property",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: List.generate(card.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          //InkWell   بيدينا تاثير الضغط
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ApartmentsScreen(),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: Row(
                              children: [
                                //  الصورة
                                Image.asset(
                                  card[index]["image"],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),

                                SizedBox(width: 10),

                                //  البيانات
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          card[index]["price"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),

                                        SizedBox(height: 5),

                                        Text("Beds: ${card[index]["beds"]}"),
                                        Text("Chairs: ${card[index]["chair"]}"),
                                        Text("Tables: ${card[index]["table"]}"),

                                        SizedBox(height: 5),

                                        Text(
                                          card[index]['number_of_individuals'],
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
