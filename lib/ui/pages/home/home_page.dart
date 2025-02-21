import 'package:bonding/ui/pages/%08home/widgets/home_bottom_navigation_bar.dart';
import 'package:bonding/ui/pages/%08home/widgets/home_floating_action_button.dart';
import 'package:bonding/ui/pages/%08home/widgets/home_indexed_stack.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeIndexedStack(),
      bottomNavigationBar: HomeBottomNavigationBar(),
      floatingActionButton: HomeFloatingActionButton(),
    );
  }
}
