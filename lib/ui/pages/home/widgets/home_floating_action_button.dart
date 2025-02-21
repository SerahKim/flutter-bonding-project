import 'package:bonding/ui/pages/%08home/home_view_model.dart';
import 'package:bonding/ui/pages/%08home/tab/home_tab/widgets/home_tab_check_list/check_list_write_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.watch(homeViewModel);
        if (currentIndex != 0) {
          return SizedBox();
        }
        return FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CheckListWritePage();
                },
              ),
            );
          },
          label: Text(
            '글쓰기',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: const Color.fromARGB(255, 85, 81, 255),
          foregroundColor: Colors.white,
        );
      },
    );
  }
}
