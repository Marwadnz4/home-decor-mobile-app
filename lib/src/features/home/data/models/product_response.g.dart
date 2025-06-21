// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: (json['id'] as num).toInt(),
      color: json['color'] as String,
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      description: json['description'] as String,
      isSale: json['is_sale'] as bool,
      salePrice: (json['sale_price'] as num?)?.toDouble(),
      image: json['image'] as String,
      rate: (json['rate'] as num).toDouble(),
      subCategoryId: json['sub_category_id'] as String,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'price': instance.price,
      'name': instance.name,
      'description': instance.description,
      'is_sale': instance.isSale,
      'sale_price': instance.salePrice,
      'image': instance.image,
      'rate': instance.rate,
      'sub_category_id': instance.subCategoryId,
    };
