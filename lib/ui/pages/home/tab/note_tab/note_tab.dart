import 'package:bonding/ui/pages/%08home/tab/note_tab/widget/note_tab_app_bar.dart';
import 'package:bonding/ui/pages/%08home/tab/note_tab/widget/note_tab_body.dart';
import 'package:flutter/material.dart';

class NoteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 다른 곳 터치하면 키보드 & 커서 해제
        },
        child: Column(
          children: [
            NoteTabAppBar(),
            NoteTabBody(),
          ],
        ),
      ),
    );
  }
}
