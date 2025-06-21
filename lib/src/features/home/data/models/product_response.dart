import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  final int id;
  final String color;
  final double price;
  final String name;
  final String description;
  @JsonKey(name: 'is_sale')
  final bool isSale;
  @JsonKey(name: 'sale_price')
  final double? salePrice;
  final String image;
  final double rate;
  @JsonKey(name: 'sub_category_id')
  final String subCategoryId;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  ProductResponse({
    required this.id,
    required this.color,
    required this.price,
    required this.name,
    required this.description,
    required this.isSale,
    required this.salePrice,
    required this.image,
    required this.rate,
    required this.subCategoryId,
  });
}
