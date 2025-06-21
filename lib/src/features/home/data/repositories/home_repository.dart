import 'package:dartz/dartz.dart';
import 'package:home_decor/src/core/networks/api_error_handler.dart';
import 'package:home_decor/src/core/networks/api_error_model.dart';
import 'package:home_decor/src/features/home/data/models/categories_response.dart';
import 'package:home_decor/src/features/home/data/models/new_collection_response.dart';
import 'package:home_decor/src/features/home/data/models/best_seller_response.dart';
import 'package:home_decor/src/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/models/sliders_response.dart';

class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository(this.remoteDataSource);

  Future<Either<ApiErrorModel, SlidersResponse>> getSliders() async {
    try {
      final result = await remoteDataSource.getSliders();
      return Right(result);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, CategoriesResponse>> getCategories() async {
    try {
      final result = await remoteDataSource.getCategories();
      return Right(result);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, BestSellerResponse>> getBestSeller() async {
    try {
      final result = await remoteDataSource.getBestSeller();
      return Right(result);
    } catch (error) {
      print(error);
      return left(ApiErrorHandler.handle(error));
    }
  }

  Future<Either<ApiErrorModel, NewCollectionResponse>>
  getNewCollection() async {
    try {
      final result = await remoteDataSource.getNewCollection();
      return right(result);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
