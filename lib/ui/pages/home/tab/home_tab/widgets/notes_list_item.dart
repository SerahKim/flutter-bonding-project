import 'package:bonding/ui/pages/note/note_view_details.dart';
import 'package:bonding/ui/widgets/tag_ui.dart';
import 'package:flutter/material.dart';

class NotesListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('글 선택됨');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteViewDetails(), // TODO: 실제 상세 페이지로 변경 필요
          ),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              // 왼쪽 테두리만 설정
              color: Colors.grey, // 테두리 색상
              width: 5.0, // 테두리 두께
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '1/13(월) 본사 점검 예정입니다.',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      print('드래그됨');
                    },
                    icon: Icon(Icons.drag_indicator),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
