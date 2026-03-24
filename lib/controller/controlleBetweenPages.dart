import 'package:flutter/material.dart';

class Controllebetweenpages extends StatefulWidget {
  const Controllebetweenpages({super.key});

  @override
  State<Controllebetweenpages> createState() => _ControllebetweenpagesState();
}

class _ControllebetweenpagesState extends State<Controllebetweenpages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Apartment",),
              Tab(text: "Rooms"),
              Tab(text: "Check"),
            ],
          ),

         
        ],
      ),
    );
  }
}
