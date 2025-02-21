// 검색 화면
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 키보드 및 포커스 해제
      },
      child: Scaffold(
        appBar: AppBar(title: Text('검색')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: '검색어를 입력하세요...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // 예제 데이터
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('검색 결과 $index'),
                      onTap: () {
                        print('검색 결과 $index 선택됨');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
