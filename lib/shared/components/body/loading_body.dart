import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoadingBody extends StatelessWidget{
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: SvgPicture.asset(
              'assets/images/loading.svg',
            ),
          ),
        ),
        const Gap(20),
        // TODO: Animate the three dots behind the text
        Flexible(
          child: Text(
            'En cours de chargement...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}