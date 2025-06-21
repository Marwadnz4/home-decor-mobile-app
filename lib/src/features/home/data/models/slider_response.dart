import 'package:json_annotation/json_annotation.dart';

part 'slider_response.g.dart';

@JsonSerializable()
class SliderResponse {
  final String image;
  const SliderResponse({required this.image});


    factory SliderResponse.fromJson(Map<String, dynamic> json) =>
      _$SliderResponseFromJson(json);
}
