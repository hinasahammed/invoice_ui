import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/res/components/common/custom_button.dart';

class SavedPasswordCard extends StatelessWidget {
  final void Function()? onPressed;
  const SavedPasswordCard({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Container(
      width: size.width,
      height: size.height * .35,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(5),
          Card(
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.colorScheme.primaryContainer,
              ),
              child: Text(
                "******",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Gap(20),
          Text(
            "Password",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const Gap(5),
          Card(
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: theme.colorScheme.primaryContainer,
              ),
              child: Text(
                "******",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Not this",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const Gap(10),
              SizedBox(
                child: CustomButton(
                  onPressed: onPressed,
                  btnTitle: "Use",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
