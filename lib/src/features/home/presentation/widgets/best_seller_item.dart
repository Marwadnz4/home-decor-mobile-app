import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/data/models/product_response.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bestSeller});

  final ProductResponse bestSeller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.screenHeight * 0.22,
          width: context.screenWidth - 80.0,
          padding: EdgeInsets.all(context.screenWidth * 0.05),
          decoration: BoxDecoration(
            color: AppColors.melon,
            borderRadius: BorderRadius.circular(context.screenWidth * 0.05),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.screenWidth * 0.05,
            children: [
              Text(
                bestSeller.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                bestSeller.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: context.screenWidth * 0.1,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.02,
                      vertical: context.screenWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.screenWidth * 0.02,
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      spacing: context.screenWidth * 0.02,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.melon,
                        ),
                        Text(
                          bestSeller.rate.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.02,
                      vertical: context.screenWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.screenWidth * 0.02,
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Text(
                      'Shop Now',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -context.screenWidth * 0.1,
          right: context.screenWidth * 0.02,
          child: Container(
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.2,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  bestSeller.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
