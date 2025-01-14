import 'package:bonding/ui/pages/%08home/home_page.dart';
import 'package:flutter/material.dart';

class InvitationCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('초대 코드 입력'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30), // 간격 추가

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // 수평 패딩 추가
            child: TextField(
              decoration: InputDecoration(
                hintText: '초대 코드를 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 25), // 간격 추가
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0), // 버튼에 수평 패딩 추가
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                '완료',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15), // 버튼 높이
                minimumSize: Size(double.infinity, 50), // 버튼 너비를 화면 가득 채움
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
