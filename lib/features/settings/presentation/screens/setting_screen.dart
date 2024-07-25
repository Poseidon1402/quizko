import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants/routes.dart';
import '../../../auth/presentation/bloc/authentication_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is InitialState) {
          context.go(Routes.login);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
                  onTap: () => context.push(Routes.about),
                  leading: const Icon(Icons.info_outline),
                  title: Text('About', style: Theme.of(context).textTheme.bodyMedium,),
                ),
                const Gap(10),
                Text(
                  'Action',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ListTile(
                  onTap: () => context.read<AuthenticationBloc>().add(LogoutEvent()),
                  leading: SvgPicture.asset('assets/icons/logout.svg'),
                  title: Text('Logout', style: Theme.of(context).textTheme.bodyMedium,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
