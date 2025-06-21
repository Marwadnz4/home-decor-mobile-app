import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/resources/app_assets.dart';
import 'package:home_decor/src/core/services/di/dependency_injection.dart';
import 'package:home_decor/src/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:home_decor/src/features/cart/presentation/pages/cart_page.dart';
import 'package:home_decor/src/features/categories/presentation/manager/cubit/categories_cubit.dart';
import 'package:home_decor/src/features/categories/presentation/pages/categories_page.dart';
import 'package:home_decor/src/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:home_decor/src/features/home/presentation/pages/home_page.dart';
import 'package:home_decor/src/features/navbar/data/models/navbar_model.dart';
import 'package:home_decor/src/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:home_decor/src/features/profile/presentation/pages/profile_page.dart';
import 'package:home_decor/src/features/wishlist/presentation/manager/cubit/wishlist_cubit.dart';
import 'package:home_decor/src/features/wishlist/presentation/pages/wishlist_page.dart';
import 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavBarInitialState());

  List<NavbarModel> pages = [
    NavbarModel(
      unSelectedIcon: AppAssets.unSelectedHomeIcon,
      selectedIcon: AppAssets.selectedHomeIcon,
      page: BlocProvider(
        create: (context) => getIt<HomeCubit>()
          ..getSliders()
          ..getCategories()
          ..getBestSeller()
          ..getNewCollections(),
        child: const HomePage(),
      ),
    ),
    NavbarModel(
      unSelectedIcon: AppAssets.unSelectedCategoriesIcon,
      selectedIcon: AppAssets.selectedCategoriesIcon,
      page: BlocProvider(
        create: (context) => getIt<CategoriesCubit>(),
        child: const CategoriesPage(),
      ),
    ),
    NavbarModel(
      unSelectedIcon: AppAssets.unSelectedCartIcon,
      selectedIcon: AppAssets.selectedCartIcon,
      page: BlocProvider(
        create: (context) => getIt<CartCubit>(),
        child: const CartPage(),
      ),
    ),
    NavbarModel(
      unSelectedIcon: AppAssets.unSelectedWishlistIcon,
      selectedIcon: AppAssets.selectedWishlistIcon,
      page: BlocProvider(
        create: (context) => getIt<WishlistCubit>(),
        child: const WishlistPage(),
      ),
    ),
    NavbarModel(
      unSelectedIcon: AppAssets.unSelectedProfileIcon,
      selectedIcon: AppAssets.selectedProfileIcon,
      page: BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
        child: const ProfilePage(),
      ),
    ),
  ];

  int bottomNavIndex = 0;

  void changeIndexInBottomNav(int index) {
    bottomNavIndex = index;
    emit(ChangeBottomNavState());
  }
}
