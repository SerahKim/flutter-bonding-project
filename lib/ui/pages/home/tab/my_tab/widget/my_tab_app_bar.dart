import 'package:flutter/material.dart';

class MyTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'MY',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print('설정 클릭됨');
          },
          icon: Icon(
            Icons.settings,
          ),
        )
      ],
    );
  }
}
