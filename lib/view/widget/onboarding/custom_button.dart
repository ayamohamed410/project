import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBotton extends StatelessWidget {
  final Color backGroundColor;
  final String text;
  final Color textColor;
  final double borderRadius;
  final double heightNum;
final BorderSide? borderSide;  final Function() onClick;

  const CustomBotton({
    super.key,
    this.backGroundColor = const Color(0xff3E4E70),
    required this.text,
    this.textColor =Colors.white,
    this.borderRadius = 8, // defult 8
    this.heightNum = 16,
    this.borderSide,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor,
        padding: EdgeInsets.symmetric(
          vertical: heightNum, // عباره عن فاريبول لتغيير سُمك الزرار
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius, // عباره عن فاريبول لتغيير الديفولت بوردر الخاص بالزرار
          ),
        ),
        side: borderSide ?? BorderSide.none
      ),

      onPressed: onClick,

      child: Text(
        text,
        style: GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
