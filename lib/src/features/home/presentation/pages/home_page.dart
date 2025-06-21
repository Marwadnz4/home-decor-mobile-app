import 'package:flutter/material.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_bloc_builder.dart';
import 'package:home_decor/src/features/home/presentation/widgets/carousel_slider_bloc_builder.dart';
import 'package:home_decor/src/features/home/presentation/widgets/categories_bloc_builder.dart';
import 'package:home_decor/src/features/home/presentation/widgets/home_app_bar.dart';
import 'package:home_decor/src/features/home/presentation/widgets/new_collection_bloc_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(context.screenWidth* 0.05),
          sliver: SliverToBoxAdapter(
            child: HomeAppBar(),
          ),
        ),
        SliverToBoxAdapter(
          child: SliderBlocBuilder(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth* 0.05),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Categories',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.melon,
                fontSize: context.screenWidth* 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(context.screenWidth* 0.05),
          sliver: SliverToBoxAdapter(
            child: CategoriesBlocBuilder(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth* 0.05),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Best Seller',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.melon,
                fontSize: context.screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: context.screenWidth* 0.05,
            right: context.screenWidth* 0.05,
            top: context.screenWidth* 0.1,
            bottom: context.screenWidth* 0.05,
          ),
          sliver: SliverToBoxAdapter(
            child: BestSellerBlocBuilder(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth* 0.05),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New Collection',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.melon,
                fontSize: context.screenWidth* 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth* 0.05,
            vertical: context.screenWidth* 0.05,
          ),
          sliver: NewCollectionBlocBuilder(),
        ),
      ],
    );
  }
}
