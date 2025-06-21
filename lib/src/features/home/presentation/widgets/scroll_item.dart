import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor/src/core/components/scroll_indicator.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/data/models/slider_response.dart';

class ScrollItem extends StatelessWidget {
  const ScrollItem({
    super.key,
    required this.itemLength,
    required this.item,
    required this.currentIndex,
  });

  final SliderResponse item;
  final int itemLength;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.008),
      child: Column(
        spacing: context.screenWidth * 0.02,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: AppColors.melon,
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    item.image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ScrollIndicator(
            mainAxisAlignment: MainAxisAlignment.center,
            currentIndex: currentIndex,
            itemLength: itemLength,
            unActiveWidth: context.screenWidth * 0.02,
            activeWidth: context.screenWidth * 0.02,
            height: 8,
          ),
        ],
      ),
    );
  }
}
