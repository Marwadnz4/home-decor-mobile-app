import 'package:home_decor/src/features/home/data/models/product_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_response.g.dart';

@JsonSerializable()
class BestSellerResponse{
  final List<ProductResponse> data;

  const BestSellerResponse({
    required this.data,
  });

    factory BestSellerResponse.fromJson(Map<String, dynamic> json) =>
      _$BestSellerResponseFromJson(json);
}
