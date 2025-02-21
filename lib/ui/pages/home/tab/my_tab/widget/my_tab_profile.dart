import 'package:bonding/ui/widgets/tag_ui.dart';
import 'package:flutter/material.dart';

class MyTabProfile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://picsum.photos/200/300'),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '손명화',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TagUI(
                      text: '주방장',
                      color: Colors.pink[100]!,
                      textColor: Colors.pink[900]!,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '입사일: 2023년 3월 15일',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('수정버튼 클릭됨');
                },
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 16),
                    Text(' 수정'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
