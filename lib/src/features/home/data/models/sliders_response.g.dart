// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sliders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidersResponse _$SlidersResponseFromJson(Map<String, dynamic> json) =>
    SlidersResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => SliderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlidersResponseToJson(SlidersResponse instance) =>
    <String, dynamic>{'data': instance.data};
