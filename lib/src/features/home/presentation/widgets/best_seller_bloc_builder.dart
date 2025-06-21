import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/data/models/product_response.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/best_seller_item.dart';
import 'package:shimmer/shimmer.dart';

class BestSellerBlocBuilder extends StatelessWidget {
  const BestSellerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is LoadingBestSellerHomeState ||
          current is SuccessBestSellerHomeState ||
          current is FailureBestSellerHomeState,
      builder: (context, state) {
        if (state is SuccessBestSellerHomeState) {
          List<ProductResponse> bestSeller = state.bestSeller.data;
          return SizedBox(
            height: context.screenHeight * 0.22,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                return BestSellerItem(bestSeller: bestSeller[index]);
              },
              separatorBuilder: (context, index) => SizedBox(
                width: context.screenWidth * 0.05,
              ),
              itemCount: bestSeller.length,
            ),
          );
        } else if (state is FailureBestSellerHomeState) {
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
      height: context.screenHeight * 0.2,
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
