import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/colors/app_color.dart';
import '../buttons/custom_elevated_button.dart';

void deleteConfirmationDialog({required BuildContext context, required VoidCallback onDeleteButtonTapped}) {
  showDialog(
    context: context,
    useRootNavigator: true,
    builder: (_) => AlertDialog.adaptive(
      elevation: 0.0,
      content: Wrap(
        children: [
          SizedBox(
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Image.asset('assets/images/on_delete.png'),
                ),
                const Gap(20),
                Text(
                  'Voulez-vous vraiment supprimer ce contenu ?',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: CustomElevatedButton(
                    onPressed: onDeleteButtonTapped,
                    borderRadius: 12,
                    backgroundColor: AppColor.purple1,
                    child: Text(
                      'Supprimer',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const Gap(10),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: CustomElevatedButton(
                    onPressed: () => context.pop(),
                    borderRadius: 12,
                    backgroundColor: AppColor.purple1.withOpacity(0.1),
                    child: Text(
                      'Annuler',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.purple1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
}