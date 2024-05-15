import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/main_tab.dart';
import '../components/bottom_app_bar_item.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.navigationShell.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
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
              onTap: () {
                setState(() => currentIndex = MainTab.home);
                widget.navigationShell.goBranch(MainTab.home);
              },
              icon: 'home',
              isSelected: currentIndex == MainTab.home,
              label: 'Home',
            ),
            BottomAppBarItem(
                onTap: () {
                  setState(() => currentIndex = MainTab.result);
                  widget.navigationShell.goBranch(MainTab.result);
                },
              icon: 'results',
              isSelected: currentIndex == MainTab.result,
              label: 'Result',
            ),
            BottomAppBarItem(
              onTap: () {
                setState(() => currentIndex = MainTab.setting);
                widget.navigationShell.goBranch(MainTab.setting);
              },
              icon: 'setting',
              isSelected: currentIndex == MainTab.setting,
              label: 'Settings',
            ),
            BottomAppBarItem(
              onTap: () {
                setState(() => currentIndex = MainTab.account);
                widget.navigationShell.goBranch(MainTab.account);
              },
              icon: 'user',
              isSelected: currentIndex == MainTab.account,
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
