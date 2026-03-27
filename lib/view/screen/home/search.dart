import 'package:agin_3/constans/colors.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(child: Text('Search',style: TextStyle(fontSize: 60),)),
    );
  }
}
