import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/data/models/product_response.dart';

class NewCollectionItem extends StatelessWidget {
  const NewCollectionItem({super.key, required this.newCollections});

  final ProductResponse newCollections;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.linen,
        borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
        border: Border.all(
          width: 1,
          color: AppColors.melon,
        ),
      ),
      child: Column(
        spacing: context.screenWidth * 0.02,
        children: [
          Expanded(
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
              child: CachedNetworkImage(
                imageUrl: newCollections.image,
                width: double.infinity,
                height: context.screenWidth * 0.2,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: context.screenWidth * 0.02,
              children: [
                Text(
                  newCollections.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  newCollections.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${newCollections.price.toString()}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.melon,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: context.screenWidth * 0.04,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(
                        Icons.favorite,
                        size: context.screenWidth * 0.04,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.02,
                    ),
                    CircleAvatar(
                      radius: context.screenWidth * 0.04,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(
                        Icons.add,
                        size: context.screenWidth * 0.04,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
