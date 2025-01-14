import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로고 이미지
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // 배경색
                ),
                padding: EdgeInsets.zero, // Container 내부 여백 제거
                margin: EdgeInsets.zero, // Container 외부 여백 제거
                child: Image.asset(
                  'assets/logo/BondinG_lightmode.png',
                  fit: BoxFit.contain, // 이미지를 Container에 맞게 조정
                ),
              ),
              SizedBox(height: 20), // 로고 아래 간격 줄임
              // 소셜 로그인 버튼
              Container(
                decoration: BoxDecoration(color: Colors.grey),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/social_logo/google_button.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      'assets/social_logo/apple_button.png',
                      width: double.infinity,
                      fit: BoxFit.contain, // 이미지를 Container에 맞게 조정
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
