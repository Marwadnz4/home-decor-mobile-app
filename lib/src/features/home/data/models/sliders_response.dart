import 'package:home_decor/src/features/home/data/models/slider_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sliders_response.g.dart';

@JsonSerializable()
class SlidersResponse {
  final List<SliderResponse> data;

  const SlidersResponse({
    required this.data,
  });

   factory SlidersResponse.fromJson(Map<String, dynamic> json) =>
      _$SlidersResponseFromJson(json);
}
