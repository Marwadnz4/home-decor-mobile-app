// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCollectionResponse _$NewCollectionResponseFromJson(
  Map<String, dynamic> json,
) => NewCollectionResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NewCollectionResponseToJson(
  NewCollectionResponse instance,
) => <String, dynamic>{'data': instance.data};
