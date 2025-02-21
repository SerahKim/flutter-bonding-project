import 'package:flutter/material.dart';

class MyTabManagementItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget nextPage;

  MyTabManagementItem({
    required this.icon,
    required this.text,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 클릭 효과를 위해 InkWell 사용
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 28, color: Colors.grey[800]),
            SizedBox(width: 15),
            Text(text, style: TextStyle(fontSize: 16)),
            Spacer(), // 남은 공간을 채워 > 아이콘을 오른쪽으로 밀어냄
            Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.grey[600]), // > 아이콘
          ],
        ),
      ),
    );
  }
}
