import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:home_decor/src/core/networks/dio_factory.dart';
import 'package:home_decor/src/features/home/data/models/best_seller_response.dart';
import 'package:home_decor/src/features/home/data/models/categories_response.dart';
import 'package:home_decor/src/features/home/data/models/new_collection_response.dart';
import 'package:home_decor/src/features/home/data/models/sliders_response.dart';

class HomeRemoteDataSource {
  Future<SlidersResponse> getSliders() async {
    final result = await DioFactory.getData(endPoint: ApiConstants.homeSlider);
    return SlidersResponse.fromJson(result.data);
  }

  Future<CategoriesResponse> getCategories() async {
    final result = await DioFactory.getData(
      endPoint: ApiConstants.homeCategories,
    );
    return CategoriesResponse.fromJson(result.data);
  }

  Future<NewCollectionResponse> getNewCollection() async {
    final result = await DioFactory.getData(
      endPoint: ApiConstants.homeNewCollections,
    );

    return NewCollectionResponse.fromJson(result.data);
  }

  Future<BestSellerResponse> getBestSeller() async {
    final result = await DioFactory.getData(
      endPoint: ApiConstants.homeBestSeller,
    );

    return BestSellerResponse.fromJson(result.data);
  }
}
