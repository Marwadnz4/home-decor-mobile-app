import 'package:get_it/get_it.dart';
import 'package:home_decor/src/core/networks/dio_factory.dart';
import 'package:home_decor/src/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:home_decor/src/features/categories/presentation/manager/cubit/categories_cubit.dart';
import 'package:home_decor/src/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/repositories/home_repository.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:home_decor/src/features/navbar/presentation/manager/cubit/navbar_cubit.dart';
import 'package:home_decor/src/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:home_decor/src/features/wishlist/presentation/manager/cubit/wishlist_cubit.dart';

final getIt = GetIt.instance;

/// Dependency Injection
void setupDi() {
  // Dio
  DioFactory.getDio();

  // navbar
  getIt.registerFactory<NavbarCubit>(() => NavbarCubit());

  // home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(getIt<HomeRemoteDataSource>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));

  // wishlist
  getIt.registerFactory<WishlistCubit>(
    () => WishlistCubit(),
  );

  // profile
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(),
  );

  // categories
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(),
  );

  // cart
  getIt.registerFactory<CartCubit>(
    () => CartCubit(),
  );
}
