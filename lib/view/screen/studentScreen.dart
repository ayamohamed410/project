import 'package:agin_3/constans/colors.dart';
import 'package:agin_3/view/screen/home/home.dart';
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
              padding: const EdgeInsets.only(top: 80),
              child: Column(children: [Image.asset("images/logoWhite.png")]),
            ),
          ),

          // الجزء الابيض المنحنى
          Align(
            alignment: AlignmentGeometry.bottomCenter,

            child: Container(
              height: 240,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),

              // المحتوي اللى بداخل المنحنى الابيض
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        AppColors.grey = Colors.lightBlue;
                      });
                    },
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
                  SizedBox(height: 10),

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
        ],
      ),
    );
  }
}
