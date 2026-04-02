import 'package:flutter/material.dart';

class Rooms extends StatefulWidget {
  const Rooms({super.key});

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return GridView(
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
                 // CardComponent(),
                
                ],
              );
  }
}