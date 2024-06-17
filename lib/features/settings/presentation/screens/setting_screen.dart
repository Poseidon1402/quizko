import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants/routes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        centerTitle: true,
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () => context.push(Routes.updatePassword),
                leading: SvgPicture.asset('assets/icons/security.svg'),
                title: Text('Security & Password', style: Theme.of(context).textTheme.bodyMedium,),
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/star.svg'),
                title: Text('Rate App', style: Theme.of(context).textTheme.bodyMedium,),
              ),
              ListTile(
                onTap: () => context.push(Routes.about),
                leading: const Icon(Icons.info_outline),
                title: Text('About', style: Theme.of(context).textTheme.bodyMedium,),
              ),
              const Gap(10),
              Text(
                'Assistance',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/file.svg'),
                title: Text('Terms and Conditions', style: Theme.of(context).textTheme.bodyMedium,),
              ),
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: Text('Contact', style: Theme.of(context).textTheme.bodyMedium,),
              ),
              const Gap(10),
              Text(
                'Action',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ListTile(
                leading: SvgPicture.asset('assets/icons/logout.svg'),
                title: Text('Logout', style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
