import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/data/models/category_response.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_state.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is LoadingCategoriesState ||
          current is SuccessCategoriesState ||
          current is FailureCategoriesState,
      builder: (context, state) {
        if (state is SuccessCategoriesState) {
          List<CategoryResponse> categories = state.categories.data;
          return SizedBox(
            height: context.screenHeight * 0.1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  spacing: context.screenWidth * 0.05,
                  children: [
                    Container(
                      height: context.screenWidth * 0.1,
                      width: context.screenWidth * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.screenWidth * 0.02,
                        ),
                        color: AppColors.linen,
                      ),

                      child: CachedNetworkImage(
                        imageUrl: categories[index].icon,
                        color: AppColors.melon,
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: textTheme.bodySmall!.copyWith(),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: context.screenWidth * 0.05,
              ),
              itemCount: categories.length,
            ),
          );
        } else if (state is FailureCategoriesState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: AppColors.darkCharcoal),
            ),
          );
        }
        return LoadingBestSeller();
      },
    );
  }
}

class LoadingBestSeller extends StatelessWidget {
  const LoadingBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.darkVanilla,
            highlightColor: AppColors.linen,
            child: SizedBox(
              height: context.screenHeight * 0.2,
              width: context.screenWidth * 0.2,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: context.screenWidth * 0.05,
        ),
        itemCount: 8,
      ),
    );
  }
}
