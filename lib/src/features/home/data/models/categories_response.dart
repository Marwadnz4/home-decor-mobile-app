import 'package:home_decor/src/features/home/data/models/category_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final List<CategoryResponse> data;

  const CategoriesResponse({
    required this.data,
  });

    factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}
