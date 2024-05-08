import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo/logo_white1.png'),
            backgroundColor: Colors.red,
            radius: 15.0,
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Hi, John Doe\n',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
              TextSpan(
                text: '@johndoe',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.purple3,
                  AppColor.blue2
                ],
                begin: Alignment.center,
                end: Alignment.bottomLeft,
              ),
            ),
            /*child: Column(
              children: [
                const SizedBox(height: 20.0),
                Text(
                  'Welcome to the Home Screen',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),*/
          ),
        ],
      ),
    );
  }
}
