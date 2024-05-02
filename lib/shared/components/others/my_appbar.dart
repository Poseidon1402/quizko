import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/colors/app_color.dart';
import '../input/custom_text_form_field.dart';

AppBar myAppBar(BuildContext context, {GlobalKey<ScaffoldState>? key}) {
  return AppBar(
    key: key,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    // TODO: Handle Image instead of a simple color
    // TODO: Should be disappeared while scrolling
    leading: const Padding(
      padding: EdgeInsets.only(left: 10),
      child: CircleAvatar(
        radius: 10,
        backgroundImage: CachedNetworkImageProvider('https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      ),
    ),
    bottom: const PreferredSize(
      preferredSize: Size(10, 20),
      child: SizedBox(),
    ),
    title: CustomTextFormField(
      hintText: 'Recherche',
      borderRadius: 32,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      hintTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColor.black4,
          ),
      prefixIcon: const Icon(
        Icons.search,
        color: AppColor.black4,
      ),
    ),
    actions: [
      InkWell(
        onTap: () => key!.currentState?.openDrawer(),
        splashColor: Colors.transparent,
        child: SvgPicture.asset('assets/icons/fluent_people-20-regular.svg'),
      ),
      const Gap(15),
      InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        child: SvgPicture.asset('assets/icons/message-dots.svg'),
      ),
      const Gap(15),
    ],
  );
}
