import 'package:flutter/material.dart';

class NoteListDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('얼그레이 라떼 레시피'),
      ),
      body: Text(
          '재료\n얼그레이 티백: 1개 (잎차 사용 시 2g) · 우유: 200ml · 바닐라 시럽: 10ml (기호에 따라 조절) · 물: 100ml · 얼음: 100g'),
    );
  }
}
