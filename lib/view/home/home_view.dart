import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invoice_ui/assets/icons/icon_asset.dart';
import 'package:invoice_ui/assets/images/image_asset.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(IconAsset.logo),
        title: const Text("Trialz"),
        actions: [
          Stack(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () => setState(() {
                  isActive = !isActive;
                }),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImageAsset.profile,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 5,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.green : Colors.deepOrange,
                  ),
                ),
              )
            ],
          ),
          const Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              ImageAsset.graph,
              width: size.width,
              fit: BoxFit.cover,
            ),
            const Gap(20),
            Card(
              clipBehavior: Clip.hardEdge,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(),
                child: Row(
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        height: 100,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.bookmark_add_outlined,
                          color: theme.colorScheme.onSurface,
                        ),
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
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: theme.colorScheme.onSurface,
                      ),
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
