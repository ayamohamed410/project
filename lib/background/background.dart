import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff2B2E58),
            Color(0xff2E3559),
            Color(0xff323F5A),
            Color(0xff3E5F5D),
            Color(0xFF000000),
            Color(0xff757575),
            Color(0xff3E4E70),
            Color(0xffCF5656),
          ],
        ),
      ),
    );
  }
}
