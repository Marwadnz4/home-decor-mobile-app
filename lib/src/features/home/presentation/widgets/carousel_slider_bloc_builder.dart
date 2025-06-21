import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/components/carousel_slider.dart';
import 'package:home_decor/src/core/extensions/size.dart';
import 'package:home_decor/src/core/resources/app_colors.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_state.dart';
import 'package:home_decor/src/features/home/presentation/widgets/scroll_item.dart';
import 'package:shimmer/shimmer.dart';

class SliderBlocBuilder extends StatelessWidget {
  const SliderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SuccessSliderState ||
          current is FailureSliderState ||
          current is LoadingSliderState,
      builder: (context, state) {
        if (state is SuccessSliderState) {
          final sliders = state.slider.data;
          return CarouselSlider.builder(
            itemCount: sliders.length,
            itemBuilder: (context, index, realIndex) => ScrollItem(
              item: sliders[index],
              itemLength: sliders.length,
              currentIndex: index,
            ),
            options: CarouselOptions(
              height: context.screenHeight * 0.29,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
          );
        } else if (state is FailureSliderState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        return const LoadingSlider();
      },
    );
  }
}

class LoadingSlider extends StatelessWidget {
  const LoadingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 8,
      options: CarouselOptions(
        height: context.screenHeight * 0.29,
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      itemBuilder: (context, index, realIndex) => Shimmer.fromColors(
        baseColor: AppColors.darkVanilla,
        highlightColor: AppColors.linen,
        child: SizedBox(
          
        ),
      ),
    );
  }
}
