import 'package:agin_3/view/card/card.dart';
import 'package:agin_3/view/screen/check.dart';
import 'package:flutter/material.dart';

class ControllebetweenTabs extends StatefulWidget {
  const ControllebetweenTabs({super.key});

  @override
  State<ControllebetweenTabs> createState() => _ControllebetweenTabsState();
}

final List card = [
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Single",
    "icon": Icons.location_on_sharp,
    "price": "2,500",
    "beds": "1",
    "chair": "1",
    "table": "1",
  },
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Double",
    "icon": Icons.location_on_sharp,
    "price": "2,000",
    "beds": "2",
    "chair": "2",
    "table": "2",
  },
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Triple",
    "icon": Icons.location_on_sharp,
    "price": "1,500",
    "beds": "3",
    "chair": "3",
    "table": "3",
  },
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Quadruple",
    "icon": Icons.location_on_sharp,
    "price": "1,000",
    "beds": "4",
    "chair": "4",
    "table": "4",
  },
];

class _ControllebetweenTabsState extends State<ControllebetweenTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Apartment"),
              Tab(text: "Rooms"),
              Tab(text: "Check"),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                //***************************is name appartments بداية اول تاب ***************************
                SingleChildScrollView(
                  child: //if space on the page not enough when using a row or column""بتعمل scroll المحتوى الموجود""
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffCFD7DA),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: ListTile(
                            title: Text(
                              "EGP 4,500",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                              ),
                            ),
                            subtitle: Text(
                              "In month",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5,
                              ),
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff53617F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minimumSize: Size(20, 44),
                              ),
                              onPressed: () {},

                              child: Text(
                                "Check Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              " Location",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 6),

                            Text(
                              " Extras",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                item(Icons.wifi, "  Wifi"),
                                SizedBox(width: 20),

                                item(Icons.archive_outlined, "  Adaptation"),
                                SizedBox(width: 20),

                                item(
                                  Icons.emoji_transportation,
                                  "Transportation",
                                ),
                              ],
                            ),
                            SizedBox(height: 6),

                            Row(
                              children: [
                                item(Icons.local_atm, " ATM"),
                                SizedBox(width: 20),

                                item(Icons.elevator_outlined, " Elevator"),
                                SizedBox(width: 20),
                                item(Icons.security, " Security"),
                                SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ////***************************is name appartments نهاية اول تاب ***************************
                ////***************************is name Rooms   بداية ثاني تاب *******************
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: card.length, // number of card
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  //يعنى كل صف فيه عنصران
                  itemBuilder: (context, index) {
                    //index is رقم العنصر (0, 1, 2, 3...)
                    return CardComponent(
                      image: card[index]["image"],
                      number_of_individuals:
                          card[index]['number_of_individuals'],
                      icon: card[index]['icon'],
                      price: card[index]["price"],
                      beds: card[index]["beds"],
                      chair: card[index]["chair"],
                      table: card[index]["table"],
                    );
                  },
                ),

                ////***************************is name Rooms   نهاية ثاني تاب *******************
                ////***************************is name check   بداية ثالث تاب *******************
                Column(
                  children: [CheckTab()],
                ),

                ////***************************is name check   نهاية ثالث تاب *******************
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// this widget because return icon behind text with character perfect
Widget item(IconData icon, String text) {
  return Row(children: [Icon(icon, size: 14), SizedBox(height: 5), Text(text)]);
}
