import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/features/cart/presentation/manager/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit() : super(InitCartState());
}
