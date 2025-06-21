import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/data/models/product_response.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/new_collection_item.dart';
import 'package:shimmer/shimmer.dart';

class NewCollectionBlocBuilder extends StatelessWidget {
  const NewCollectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is LoadingNewCollectionsState ||
          current is SuccessNewCollectionsState ||
          current is FailureNewCollectionsState,
      builder: (context, state) {
        if (state is SuccessNewCollectionsState) {
          List<ProductResponse> newCollections = state.newCollections.data;
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => NewCollectionItem(
                newCollections: newCollections[index],
              ),
              childCount: newCollections.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: context.screenWidth * 0.05,
              crossAxisSpacing: context.screenWidth * 0.05,
              childAspectRatio: .8,
            ),
          );
        } else if (state is FailureNewCollectionsState) {
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
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Shimmer.fromColors(
          baseColor: AppColors.darkVanilla,
          highlightColor: AppColors.linen,
          child: SizedBox(
            height: context.screenHeight * 0.2,
            width: context.screenWidth * 0.2,
          ),
        ),
        childCount: 8,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: context.screenWidth * 0.05,
        crossAxisSpacing: context.screenWidth * 0.05,
        childAspectRatio: .8,
      ),
    );
  }
}
