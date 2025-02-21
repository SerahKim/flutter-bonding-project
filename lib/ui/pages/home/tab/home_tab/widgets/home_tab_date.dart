import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 형식 변환을 위해 필요

class HomeTabDate extends StatefulWidget {
  @override
  _HomeTabDateState createState() => _HomeTabDateState();
}

class _HomeTabDateState extends State<HomeTabDate> {
  DateTime selectedDate = DateTime.now(); // 초기 날짜 설정

  // 날짜 선택 함수
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            hintColor: Colors.grey,
            colorScheme: ColorScheme.light(
              primary: const Color.fromARGB(255, 85, 81, 255),
            ), // 선택된 날짜 색상
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: Colors.white, // 다이얼로그 배경색
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // 선택한 날짜 업데이트
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Text(
                DateFormat('yyyy년 M월 d일').format(selectedDate), // 날짜 형식 변환
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () => selectDate(context), // 날짜 선택 함수 호출
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
