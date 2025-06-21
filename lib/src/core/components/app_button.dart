import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.5,
      height: context.screenHeight * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.melon,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.fuzzyWuzzy,
            fontSize: context.screenHeight * 0.02,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
