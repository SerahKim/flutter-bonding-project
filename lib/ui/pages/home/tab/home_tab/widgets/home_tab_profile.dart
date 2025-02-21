import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 시간 처리를 위해 추가

class HomeTabProfile extends StatelessWidget {
  // 샘플 데이터
  final List<Map<String, dynamic>> profiles = [
    {
      'name': '김시은',
      'imageUrl': 'https://picsum.photos/200/300',
      'department': '매니저',
      'workHours': '09:00 - 18:00',
      'phoneNumber': '010-1234-5678',
    },
    {
      'name': '김민지',
      'imageUrl': null,
      'department': '주방',
      'workHours': '10:00 - 16:00',
      'phoneNumber': '010-2345-6789',
    },
    {
      'name': '최민영',
      'imageUrl': 'https://picsum.photos/200/300',
      'department': '샌드위치',
      'workHours': '12:00 - 20:00',
      'phoneNumber': '010-3456-7890',
    },
    {
      'name': '김지원',
      'imageUrl': null,
      'department': '홀',
      'workHours': '08:00 - 14:00',
      'phoneNumber': '010-4567-8901',
    },
    {
      'name': '강민지',
      'imageUrl': 'https://picsum.photos/200/300',
      'department': '파트 1',
      'workHours': '15:00 - 23:00',
      'phoneNumber': '010-5678-9012',
    },
    {
      'name': '손명화',
      'imageUrl': 'https://picsum.photos/200/300',
      'department': '파트 2',
      'workHours': '07:00 - 13:00',
      'phoneNumber': '010-6789-0123',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentTime = DateFormat('HH:mm').format(now);

    // 근무 시간 기준으로 isActive 설정
    final sortedProfiles = profiles.map((profile) {
      return {
        ...profile,
        'isActive': _isCurrentlyWorking(profile['workHours'], currentTime),
      };
    }).toList()
      ..sort((a, b) => b['isActive']
          ? 1
          : a['isActive']
              ? -1
              : 0);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: sortedProfiles.map((profile) {
            return _buildProfileItem(context, profile);
          }).toList(),
        ),
      ),
    );
  }

  // 현재 시간이 workHours 범위에 포함되는지 확인
  bool _isCurrentlyWorking(String workHours, String currentTime) {
    try {
      final times = workHours.split(' - ');
      final startTime = times[0];
      final endTime = times[1];

      return currentTime.compareTo(startTime) >= 0 &&
          currentTime.compareTo(endTime) <= 0;
    } catch (e) {
      print('근무 시간 오류: $workHours');
      return false;
    }
  }

  Widget _buildProfileItem(BuildContext context, Map<String, dynamic> profile) {
    final bool isActive = profile['isActive'];
    final String? imageUrl = profile['imageUrl'];
    final String name = profile['name'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () => showProfileDialog(context, profile),
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
  }

  // 프로필 선택 시 다이얼로그 표시
  void showProfileDialog(BuildContext context, Map<String, dynamic> profile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(profile['name'],
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: profile['imageUrl'] != null
                    ? NetworkImage(profile['imageUrl'])
                    : AssetImage('assets/profile/default_image.png')
                        as ImageProvider,
              ),
              SizedBox(height: 12),
              buildProfileDetail('소속', profile['department']),
              buildProfileDetail('근무시간', profile['workHours']),
              buildProfileDetail('연락처', profile['phoneNumber']),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('닫기'),
            ),
            TextButton(
              onPressed: () {
                print('연락하기 클릭 - ${profile['phoneNumber']}');
              },
              child:
                  Text('연락하기', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Widget buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
