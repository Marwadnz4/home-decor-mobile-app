import 'package:home_decor/src/features/home/data/models/product_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_collection_response.g.dart';

@JsonSerializable()
class NewCollectionResponse{
  final List<ProductResponse> data;

  const NewCollectionResponse({
    required this.data,
  });

    factory NewCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$NewCollectionResponseFromJson(json);
}
