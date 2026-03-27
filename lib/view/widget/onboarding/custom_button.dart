import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agin_3/background/background.dart';

class CustomBotton extends StatelessWidget {
  final Color backGroundColor;
  final String text;
  final Color textColor;
  final Function() onClick;

  const CustomBotton({
    super.key,
    this.backGroundColor = const Color(0xff3E4E70),
    required this.text,
    this.textColor = Colors.white,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      onPressed: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
