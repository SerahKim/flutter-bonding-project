import 'package:bonding/ui/widgets/tag_ui.dart';
import 'package:flutter/material.dart';

class NoteViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              print('수정됨');
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              print('수정됨');
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1/13(월) 본사 점검 예정입니다.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                TagUI(
                  text: '주방',
                  color: Colors.pinkAccent[100]!,
                ),
                SizedBox(width: 3),
                TagUI(
                  text: '샌드위치',
                  color: Colors.green[300]!,
                ),
                SizedBox(width: 3),
                TagUI(
                  text: '홀',
                  color: const Color.fromARGB(255, 246, 150, 144),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '안녕하세요, 여러분.\n1월 13일(월)에 본사 점검이 예정되어 있습니다. 정확한 방문 시간은 확정되지 않은 상태입니다. 그러니 당일에는 특히 인사와 위생에 신경 써주시길 부탁드립니다.\n또, 점검 관련해서 각 그룹별로 추가 공지사항이 올라갈 예정이니, 꼭 확인해주시고 빠르게 준비 부탁드립니다. \n모두 수고 많으십니다. 감사합니다!',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '마지막 편집자 : 김시은',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 10),
            Spacer(),
            Divider(height: 20),
            Text(
              '참여자 리스트',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orange[800],
                  child: Text(
                    '시은',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    '민영',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    '민지',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    '지원',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Chip(
                  avatar: Icon(Icons.check),
                  label: const Text('네!'),
                ),
                SizedBox(width: 8),
                Chip(
                  avatar: Icon(Icons.favorite_outline),
                  label: const Text('좋아요'),
                ),
              ],
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
