import 'package:flutter/material.dart';

class HomeTabProfile extends StatelessWidget {
  // 샘플 데이터
  final List<Map<String, dynamic>> profiles = [
    {
      'name': '김시은',
      'imageUrl': 'https://picsum.photos/200/300', // 프로필 사진 URL
      'isActive': true,
    },
    {
      'name': '김민지',
      'imageUrl': null, // 프로필 사진 없음
      'isActive': false,
    },
    {
      'name': '최민영',
      'imageUrl': 'https://picsum.photos/200/300',
      'isActive': true,
    },
    {
      'name': '김지원',
      'imageUrl': null,
      'isActive': true,
    },
    {
      'name': '강민지',
      'imageUrl': 'https://picsum.photos/200/300',
      'isActive': false,
    },
    {
      'name': '손명화',
      'imageUrl': 'https://picsum.photos/200/300',
      'isActive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 활성화된 사람들을 앞으로 정렬
    final sortedProfiles = List<Map<String, dynamic>>.from(profiles)
      ..sort((a, b) {
        final bool aActive = a['isActive'] as bool;
        final bool bActive = b['isActive'] as bool;
        return bActive
            ? 1
            : aActive
                ? -1
                : 0;
      });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: sortedProfiles.map((profile) {
            final bool isActive = profile['isActive'] ?? false;
            final String? imageUrl = profile['imageUrl'];
            final String name = profile['name'];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('프로필 선택됨');
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: imageUrl != null
                              ? NetworkImage(imageUrl)
                              : AssetImage('assets/profile/default_image.png')
                                  as ImageProvider, // 기본 프로필 이미지
                          child: !isActive
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(
                      color: isActive ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
