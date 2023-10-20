// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) {
  return RecipeModel(
    json['background_border_color'] as String?,
    json['background_end_color'] as String?,
    json['background_start_color'] as String?,
    json['jump_url'] as String?,
    json['right_image'] as String?,
    json['text'] as String?,
    json['text_color'] as String?,
  );
}

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'background_border_color': instance.background_border_color,
      'background_end_color': instance.background_end_color,
      'background_start_color': instance.background_start_color,
      'jump_url': instance.jump_url,
      'right_image': instance.right_image,
      'text': instance.text,
      'text_color': instance.text_color,
    };
