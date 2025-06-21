import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed,
    this.height,
    this.upperCase = true,
    this.fontWeight,
    this.backGroundColor,
    this.fontColor,
    this.width,
  });

  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final bool upperCase;
  final FontWeight? fontWeight;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.screenHeight * 0.06,
      width: width ?? double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor ?? AppColors.melon,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          upperCase ? text.toUpperCase() : text,
          textScaler: TextScaler.linear(1.0),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: fontSize ?? context.screenHeight * 0.02,
            fontWeight: FontWeight.w600,
            color: fontColor ?? AppColors.fuzzyWuzzy,
          ),
        ),
      ),
    );
  }
}
