import 'package:agin_3/constans/colors.dart';
import 'package:agin_3/controller/controlleBetweentabs.dart';
import 'package:agin_3/view/card/card.dart';
import 'package:agin_3/view/screen/apartments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // الخلفيه
            Container(
              padding: EdgeInsets.all(30),
              height: 260,
              color: Color(0xff3E4E70),

              child: Column(
                children: [
                  ///  location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "22, street Elmansoura , Egypt",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),

                  SizedBox(height: 15),

                  //filter icon
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.tune, color: Color(0xff3E4E70)),
                        ),
                      ),

                      // textField
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            fillColor: Colors.white,
                            filled: true, //كي يظهر اللون يجب كتابتها بتروو
                            hint: Text(
                              "Search",
                              style: TextStyle(fontSize: 20),
                            ),
                            prefixIcon: Icon(Icons.search, size: 27),

                            suffixIcon: Icon(Icons.mic_none_rounded, size: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //الجزء الابيض المنحنى
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(left: 9, right: 9),
                    margin: EdgeInsets.only(
                      top: 143,
                    ), //  يخليه يدخل جوا على الأزرق

                    height: 190,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Image.asset("images/photoHomeScreen.jpg"),
                  ),
                ),

                // ما بداخل الجزء الابيض المنحنى
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recommended Property",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                    SizedBox(
                      height: 240,
                      child: ListView.builder(
                        shrinkWrap:
                            true, // الـ shrinkWrap: true بيخلي الـ ListView ياخد طول العناصر الفعلي بدل طول لا نهائي.
                        physics:
                            NeverScrollableScrollPhysics(), // عشان Scroll الرئيسي يشتغل

                        scrollDirection: Axis.horizontal,
                        itemCount: card.length,
                        itemBuilder: (context, index) {
                          // child: Material(
                          //   borderRadius: BorderRadius.circular(16),
                          //   child: InkWell(
                          //     //InkWell   بيدينا تاثير الضغط
                          //     borderRadius: BorderRadius.circular(16),
                          //     onTap: () {
                          //       Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //           builder: (context) => ApartmentsScreen(),
                          //         ),
                          //       );
                          //     },

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            child: SizedBox(
                              width: 170, // مهم جدًا
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 4, // gives the card a shadow effect
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    //  الصورة
                                    Image.asset(
                                      "images/home1.jpg",
                                      width: 160,
                                      height: 110,

                                      fit: BoxFit.cover,
                                    ),

                                    SizedBox(height: 8),

                                    //  البيانات
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Near Heavan Apartments",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 5),

                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                size: 13,
                                                color: Colors.grey,
                                              ),
                                              Text(
                                                "Elmansoura",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                "4,500",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff3E4E70),
                                                ),
                                              ),
                                              Text(
                                                "/month",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nearby Property",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3E4E70),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //**************************** */
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
                                elevation: 4, // gives the card a shadow effect
                                child: Row(
                                  children: [
                                    //  الصورة
                                    Image.asset(
                                      "images/home1.jpg",
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
                                            SizedBox(height: 5),

                                            Text(
                                              "Near Heavan Apartments",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 5),

                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 13,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "Elmansoura",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Text(
                                                  "4,500",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff3E4E70),
                                                  ),
                                                ),
                                                Text(
                                                  "/month",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
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
              ], //         ),
            ),
          ],
        ),
      ),
    );
  }
}
