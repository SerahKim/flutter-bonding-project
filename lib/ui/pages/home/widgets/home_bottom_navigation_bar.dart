import 'package:bonding/ui/pages/%08home/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.watch(homeViewModel);
        final viewModel = ref.read(homeViewModel.notifier);
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 라벨 항상 표시
          currentIndex: currentIndex,
          onTap: viewModel.onIndexChanged,
          iconSize: 28,
          selectedItemColor: Colors.black, // 선택된 아이템의 색상
          unselectedItemColor: Colors.grey, // 선택되지 않은 아이템의 색상
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.house_outlined),
              activeIcon: Icon(Icons.home),
              label: '홈',
              tooltip: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_outlined),
              activeIcon: Icon(Icons.note),
              label: '업무',
              tooltip: '업무',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              activeIcon: Icon(Icons.calendar_month),
              label: '캘린더',
              tooltip: '캘린더',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_outlined),
              activeIcon: Icon(Icons.manage_accounts),
              label: '마이',
              tooltip: '마이',
            ),
          ],
        );
      },
    );
  }
}
