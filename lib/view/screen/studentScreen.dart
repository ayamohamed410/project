import 'package:agin_3/constans/colors.dart';
import 'package:agin_3/view/screen/home/home.dart';
import 'package:agin_3/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // ؟

        // Stack = بيخلي الودجت فوق بعض (layers)

        // زي الفوتوشوب:}

        // خلفية فوقها لوجو
        //{  فوقهم فورم
        // استخدت استاك علشان اقسم الشاشه لنصفين
        children: [
          // الخلفيه الزرقاء
          Container(color: Color(0xff3E4E70)),
          //  الصوره فى المنتصف
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Column(
                children: [Image.asset("images/logoWhite.png", scale: 2.1)],
              ),
            ),
          ),

          // الجزء الابيض المنحنى
          Align(
            alignment: AlignmentGeometry.bottomCenter,

            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height:
                    MediaQuery.of(context).size.height *
                    0.42, // بيخليه يعتمد على حجم الشاشة (مش رقم ثابت)
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21.5),

                // المحتوي اللى بداخل المنحنى الابيض
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Student",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.5,
                          color: Color(0xff585858),
                        ),
                      ),

                      icon: Icon(Icons.person),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.grey,
                        minimumSize: Size(double.infinity, 45),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Owner",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.5,
                          color: Color(0xff585858),
                        ),
                      ),

                      icon: Icon(Icons.person_3_outlined),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffE2E2E2),
                        minimumSize: Size(double.infinity, 45),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),

                    // الزراير
                    MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      color: Color(0xff3E4E70),

                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Text(
                        "Contuine",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
