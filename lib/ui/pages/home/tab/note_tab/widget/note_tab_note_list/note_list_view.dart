import 'package:bonding/ui/pages/%08home/tab/note_tab/widget/note_tab_note_list/note_list_detail_page.dart';
import 'package:flutter/material.dart';

class NoteListView extends StatelessWidget {
  final String? imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NoteListDetailPage();
                  },
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // 그림자 너무 진하지 않게 조정
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 정렬 개선
                children: [
                  // ⬜ 정사각형 이미지 (비율 유지)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl!,
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover, // 꽉 차게 설정
                    ),
                  ),
                  SizedBox(width: 12), // 이미지와 텍스트 사이 여백

                  // 📜 텍스트 영역
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                      children: [
                        // 🏷️ 제목
                        Text(
                          '얼그레이 라떼 레시피',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4), // 제목과 내용 간격

                        // 📄 내용 (길면 ...으로 처리)
                        Text(
                          '재료\n얼그레이 티백: 1개 (잎차 사용 시 2g) · 우유: 200ml · 바닐라 시럽: 10ml (기호에 따라 조절) · 물: 100ml · 얼음: 100g',
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[800]),
                          maxLines: 3, // 최대 두 줄까지만 표시
                          overflow: TextOverflow.ellipsis, // 길면 "..." 처리
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
