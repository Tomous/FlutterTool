import 'package:json_annotation/json_annotation.dart';
part 'collect_users_model.g.dart';

@JsonSerializable()
class CollectionUserModel {
  /// 用户id
  int id;
  bool is_prime;

  /// 用户名字
  String n;

  /// 用户头像
  String p;
  String verified_image;

  CollectionUserModel(
      this.id, this.is_prime, this.n, this.p, this.verified_image);
  factory CollectionUserModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionUserModelToJson(this);
}
