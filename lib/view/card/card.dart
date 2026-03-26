import 'package:agin_3/controller/controlleBetweentabs.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,
    required this.image,
    required this.number_of_individuals,
    required this.icon,
    required this.price,
    required this.beds,
    required this.chair,
    required this.table,
  });

  final String image;
  final String number_of_individuals;
  final IconData icon;
  final String price;
  final String beds;
  final String chair;
  final String table;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(number_of_individuals, style: TextStyle(fontSize: 15)),
                Text(price, style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(icon, size: 12, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  "Elmansoura",
                  style: TextStyle(fontSize: 8, color: Colors.blueGrey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item(Icons.bed, beds),
                SizedBox(width: 12),

                item(Icons.chair_alt_rounded, chair),
                SizedBox(width: 12),
                item(Icons.table_restaurant_sharp, table),
              ],
            ),

            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                color: const Color.fromARGB(255, 25, 59, 110),
                child: Text(
                  "Booking",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 212, 211, 211),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
