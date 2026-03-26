import 'package:flutter/material.dart';

class CheckTab extends StatefulWidget {
  const CheckTab({super.key});

  @override
  State<CheckTab> createState() => _CheckTabState();
}

class _CheckTabState extends State<CheckTab> {
  DateTime? checkIn;
  DateTime? checkOut;

  Future<void> selectDate(BuildContext context, bool isCheckIn) async {
    //   دي دالة بتفتح الكاليندر
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      // لو المستخدم اختار تاريخ
      setState(() {
        if (isCheckIn) {
          ////لو ضغط على Check in → يخزن في checkIn
          // لو Check out → يخزن في checkOut
          checkIn = selectedDate;
        } else {
          checkOut = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Booking Request",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                //  Expended بيخلي كل مربع ياخد نص الشاشة
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Check in:"),
                    SizedBox(height: 12),
                    Material(
                      child: InkWell(
                        ///1- تخلي العنصر يتضغط
                        //2- تضيف animation (زي زرار حقيقي)," واللى بيساعدها على النقطه دي هو  انه نضيفها داخل  ماتريال ويدجت"
                        onTap: () => selectDate(context, true),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                //لو مفيش تاريخ → يظهر "Select date"
                                // لو فيه → يظهر التاريخ
                                checkIn == null
                                    ? "Select date"
                                    : "${checkIn!.day}/${checkIn!.month}/${checkIn!.year}",
                              ),
                              Icon(Icons.calendar_today, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Check Out:"),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => selectDate(context, false),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              checkOut == null
                                  ? "Select date"
                                  : "${checkOut!.day}/${checkOut!.month}/${checkOut!.year}",
                            ),
                            Icon(Icons.calendar_today, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            // height: 30,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {},
              color: const Color.fromARGB(255, 25, 59, 110),
              child: Text(
                "Booking Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
