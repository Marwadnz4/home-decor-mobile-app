import 'package:flutter/material.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.melon,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create spaces that bring joy',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(Icons.search,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
