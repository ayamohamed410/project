import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatefulWidget {
  final String lableText;
  final bool isPassword;

  const CustomTextfield({
    super.key,
    required this.lableText,
    this.isPassword = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? obscureText : false,
      decoration: InputDecoration(
        labelText: widget.lableText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.only(left: 16.38),
        labelStyle: GoogleFonts.openSans(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Color(0xFF000000),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff757575)),
        ),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.remove_red_eye,
                ),
              )
            : null,
      ),
    );
  }
}
