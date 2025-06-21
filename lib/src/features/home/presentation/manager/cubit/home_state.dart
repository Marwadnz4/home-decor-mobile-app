import 'package:home_decor/src/features/home/data/models/best_seller_response.dart';
import 'package:home_decor/src/features/home/data/models/categories_response.dart';
import 'package:home_decor/src/features/home/data/models/new_collection_response.dart';
import 'package:home_decor/src/features/home/data/models/sliders_response.dart';

sealed class HomeState {}

class InitHomeState extends HomeState {}

class LoadingSliderState extends HomeState {}

class SuccessSliderState extends HomeState {
  final SlidersResponse slider;

  SuccessSliderState({required this.slider});
}

class FailureSliderState extends HomeState {
  final String message;

  FailureSliderState({required this.message});
}

class LoadingCategoriesState extends HomeState {}

class SuccessCategoriesState extends HomeState {
  final CategoriesResponse categories;

  SuccessCategoriesState({required this.categories});
}

class FailureCategoriesState extends HomeState {
  final String message;

  FailureCategoriesState({required this.message});
}

class LoadingBestSellerHomeState extends HomeState {}

class SuccessBestSellerHomeState extends HomeState {
  final BestSellerResponse bestSeller;

  SuccessBestSellerHomeState({required this.bestSeller});
}

class FailureBestSellerHomeState extends HomeState {
  final String message;

  FailureBestSellerHomeState({required this.message});
}

class LoadingNewCollectionsState extends HomeState {}

class SuccessNewCollectionsState extends HomeState {
  final NewCollectionResponse newCollections;

  SuccessNewCollectionsState({required this.newCollections});
}

class FailureNewCollectionsState extends HomeState {
  final String message;

  FailureNewCollectionsState({required this.message});
}
