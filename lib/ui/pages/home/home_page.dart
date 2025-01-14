import 'package:bonding/ui/pages/%08home/widgets/bottom_bar.dart';
import 'package:bonding/ui/pages/%08home/widgets/indexed_stack.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeIndexedStack(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
