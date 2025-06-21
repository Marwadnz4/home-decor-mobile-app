import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/lang.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class OnboardingWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onSkipPressed;
  final int currentPage;

  const OnboardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onSkipPressed,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: context.screenHeight * 0.62,
              decoration: BoxDecoration(
                color: AppColors.linen,
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(34.0),
                ),
              ),
            ),
            Container(
              height: context.screenHeight * 0.58,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(34.0),
                ),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 16.0,
              right: 16.0,
              child: TextButton(
                onPressed: onSkipPressed,
                child: Text(
                  context.l10n.skip,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.06),
        Text(
          title,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: AppColors.melon,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0,
            color: AppColors.darkCharcoal,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
