import 'package:flutter/material.dart';

import 'notes_list_item.dart';

class HomeTabListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 1,
        padding: EdgeInsets.only(
          top: 10,
          right: 20,
        ),
        itemBuilder: (context, index) {
          return NotesListItem();
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.transparent,
            height: 30,
          );
        },
      ),
    );
  }
}
