import 'package:bonding/ui/pages/%08home/home_page.dart';
import 'package:bonding/ui/pages/invitation/invitation_code_input.dart';
import 'package:flutter/material.dart';

Future<void> showTeamSelectionModal(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 높이 조정 가능
    enableDrag: true, // 드래그로 닫기 허용
    isDismissible: true, // 탭으로 닫기 허용
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.8, // 화면 높이의 80%
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 상단 텍스트와 닫기 버튼
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '팀으로 시작하기',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                Divider(height: 30),
                SizedBox(height: 10),
                // 초대 코드 입력 버튼
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvitationCodeInput(),
                      ),
                    );
                  },
                  child: Text(
                    '초대 코드 입력하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // 새로운 팀 생성 버튼
                buildButton(context, HomePage(), '새로운 팀 생성하기'),
                SizedBox(height: 20),
                // 기존 팀 목록 제목
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '이미 참여하고 있는 팀',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // 기존 팀 목록
                buildButton(context, HomePage(), '뚜레쥬르 강남역점'),
                buildButton(context, HomePage(), '매스캔수학학원'),
                buildButton(context, HomePage(), '올리브영 가로수길점'),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget buildButton(
  BuildContext context,
  Widget nextPage,
  String text,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              size: 35,
            ),
          ],
        ),
      ),
    ),
  );
}
