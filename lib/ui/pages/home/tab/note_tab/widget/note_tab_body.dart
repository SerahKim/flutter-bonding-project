import 'package:bonding/ui/pages/%08home/tab/note_tab/widget/note_tab_tab_bar.dart';
import 'package:flutter/material.dart';

class NoteTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            NoteTabTabBar(),
          ],
        ),
      ),
    );
  }
}
