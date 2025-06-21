import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/features/home/data/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepo;

  HomeCubit(this.homeRepo) : super(InitHomeState());

  void getSliders() async {
    emit(LoadingSliderState());
    final response = await homeRepo.getSliders();
    response.fold(
      (error) {
        emit(FailureSliderState(message: error.message ?? 'Failure'));
      },
      (sliderResponse) async {
        emit(SuccessSliderState(slider: sliderResponse));
      },
    );
  }

   void getCategories() async {
    emit(LoadingCategoriesState());
    final response = await homeRepo.getCategories();
    response.fold(
      (error) {
        emit(FailureCategoriesState(message: error.message ?? 'Failure'));
      },
      (categoriesResponse) async {
        emit(SuccessCategoriesState(categories: categoriesResponse));
      },
    );
  }

   void getBestSeller() async {
    emit(LoadingBestSellerHomeState());
    final response = await homeRepo.getBestSeller();
    response.fold(
      (error) {
        emit(FailureBestSellerHomeState(message: error.message ?? 'Failure'));
      },
      (bestSellerResponse) async {
        emit(SuccessBestSellerHomeState(bestSeller: bestSellerResponse));
      },
    );
  }

   void getNewCollections() async {
    emit(LoadingNewCollectionsState());
    final response = await homeRepo.getNewCollection();
    response.fold(
      (error) {
        emit(FailureNewCollectionsState(message: error.message ?? 'Failure'));
      },
      (newCollectionsResponse) async {
        emit(SuccessNewCollectionsState(newCollections: newCollectionsResponse));
      },
    );
  }
}
