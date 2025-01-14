import 'package:bonding/ui/pages/login/login_page.dart';
import 'package:bonding/ui/pages/start/start_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 설정
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // 페이드 인/아웃 애니메이션 설정
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    // 애니메이션 시작
    _controller.forward();

    // 2초 후 로그인 페이지로 이동
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              StartPage(), // 여기에 로그인 페이지 위젯을 넣으세요
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/logo/BondinG_lightmode.png'),
        ),
      ),
    );
  }
}
