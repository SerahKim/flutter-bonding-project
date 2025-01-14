import 'package:bonding/ui/pages/start/personal/personal_start_page.dart';
import 'package:bonding/ui/pages/start/team/team_start_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          // bonding text
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Image.asset(
                'assets/logo/text.png',
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          // button 설정
          startButton(
            context,
            () async {
              await showTeamSelectionModal(context);
            },
            '팀으로 시작하기',
            '팀 단위로 업무를 설정하고 공유하세요.',
          ),
          SizedBox(
            height: 30,
          ),
          startButton(
            context,
            () async {
              await showPersonalSelectionModal(context);
            },
            '개인으로 시작하기',
            '나만의 업무를 간단히 관리해보세요.',
          ),
          Spacer(),
        ],
      ),
    );
  }
}

Widget startButton(
  BuildContext context,
  VoidCallback onTap,
  String title,
  String description,
) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
