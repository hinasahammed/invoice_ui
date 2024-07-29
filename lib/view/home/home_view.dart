import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/icons/logo.png'),
        title: const Text("Trialz"),
        actions: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/images/profile.png",
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              "assets/images/graph.png",
              width: size.width,
              fit: BoxFit.cover,
            ),
            const Gap(20),
            Card(
              clipBehavior: Clip.hardEdge,prp
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Color(0xff0f0f0f),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 30,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.bookmark_add_outlined,
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bookings",
                          style: theme.textTheme.labelLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "123",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Reserved",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.onSurface.withOpacity(.4),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xff131313),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
