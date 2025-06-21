import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({
    super.key,
    required this.currentIndex,
    required this.itemLength,
    this.unActiveWidth,
    this.activeWidth,
    this.height,
    this.mainAxisAlignment,
  });

  final int currentIndex;
  final int itemLength;
  final double? unActiveWidth;
  final double? activeWidth;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: List.generate(itemLength, (index) {
        return Padding(
          padding: EdgeInsets.only(right: context.screenWidth * 0.02),
          child: AnimatedContainer(
            height: height ?? context.size!.height * 0.02,
            width: currentIndex == index
                ? activeWidth ?? context.screenWidth * 0.02
                : unActiveWidth ?? context.screenWidth * 0.02,
            duration: const Duration(milliseconds: 700),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: currentIndex == index
                  ? AppColors.melon
                  : AppColors.linen,
            ),
          ),
        );
      }),
    );
  }
}
