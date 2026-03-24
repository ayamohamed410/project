import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.title, required this.titleNum});

  final String title;
  final String titleNum;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset("images/home1.jpeg", height: 120),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            ListTile(
              title: Text(
                "$titleNum"
                " Sofa",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              trailing: Text(
                "$titleNum"
                " Table",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
            ),

            ListTile(
              title: Text(
                "$titleNum"
                "Bed",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              trailing: Text(
                "$titleNum"
                "Hair",
                style: TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: const Color.fromARGB(255, 25, 59, 110),
              child: Text(
                "1000LE /month",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 212, 211, 211),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
