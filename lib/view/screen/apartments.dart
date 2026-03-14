import 'package:agin_3/view/card/card.dart';
import 'package:flutter/material.dart';

class ApartmentsScreen extends StatefulWidget {
  const ApartmentsScreen({super.key});

  @override
  State<ApartmentsScreen> createState() => _ApartmentsScreenState();
}

int selectedIndex = 0;

final List<String> images = [
  'images/home1.jpeg',
  'images/home2.jpeg',
  'images/home3.jpeg',
  'images/home4.jpeg',
  'images/home5.jpeg',
];

class _ApartmentsScreenState extends State<ApartmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(images[selectedIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // شريط الصور
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),

                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10)),

                  Text(
                    "Lorem ipsum dolor ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  //**************** */
                  SizedBox(height: 6),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: const Color.fromARGB(255, 20, 49, 92),
                      ),
                      Text(
                        "Lorem ipsum dolor ",
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 11, 53, 87),
                        ),
                      ),
                    ],
                  ),
                  //****************** */
                  SizedBox(height: 6),

                  Text(
                    "Description ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur.Parturient",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "vulputate enim viverra ullamcorper leo elit..  Lorem",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "ipsum dolor sit amet consectetur. Parturient enim",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "viverra ullamcorper leo elit..Lorem ipsum dolor sit amet  ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(height: 10),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),

              Container(height: 10),
              Text(
                "Rooms",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              GridView(
                //**************************** */
                //ListView حاطط
                //GridView داخل
                //ده يسبب الخطأ المشهور://Vertical viewport was given unbounded height
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //************************ */
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 330,
                ),
                children: [
                  //الكارد
                  CardComponent(title: "Single", titleNum: "1"),
                  CardComponent(title: "Double", titleNum: "2"),
                  CardComponent(title: "Triple", titleNum: "3"),
                  CardComponent(title: "Room3", titleNum: "4"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}