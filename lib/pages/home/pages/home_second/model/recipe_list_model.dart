// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'recipe_list_model.g.dart';

/// 列表模型数组
class RecipeModelList {
  List<RecipeModel> list;
  RecipeModelList(this.list);
  factory RecipeModelList.fromJson(List<dynamic> list) {
    return RecipeModelList(
      list.map((item) => RecipeModel.fromJson(item)).toList(),
    );
  }
}

@JsonSerializable()
class RecipeModel {
  /// 边跨颜色
  String? background_border_color;

  /// 背景开始颜色
  String? background_end_color;

  /// 背景结束颜色
  String? background_start_color;

  /// 上面图片
  // ignore: non_constant_identifier_names
  String? jump_url;

  /// 右边图片
  // ignore: non_constant_identifier_names
  String? right_image;

  /// 文字显示
  String? text;

  /// 文字颜色
  // ignore: non_constant_identifier_names
  String? text_color;

  RecipeModel(
      this.background_border_color,
      this.background_end_color,
      this.background_start_color,
      this.jump_url,
      this.right_image,
      this.text,
      this.text_color);
  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}
