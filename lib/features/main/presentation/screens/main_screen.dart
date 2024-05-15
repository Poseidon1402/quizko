import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../components/bottom_app_bar_item.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        elevation: 0.0,
        color: AppColor.white1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomAppBarItem(
              onTap: () {},
              icon: 'home',
              label: 'Home',
            ),
            BottomAppBarItem(
              onTap: () {},
              icon: 'results',
              label: 'Result',
            ),
            BottomAppBarItem(
              onTap: () {},
              icon: 'setting',
              label: 'Settings',
            ),
            BottomAppBarItem(
              onTap: () {},
              icon: 'user',
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
