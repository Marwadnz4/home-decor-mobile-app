// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerResponse _$BestSellerResponseFromJson(Map<String, dynamic> json) =>
    BestSellerResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BestSellerResponseToJson(BestSellerResponse instance) =>
    <String, dynamic>{'data': instance.data};
