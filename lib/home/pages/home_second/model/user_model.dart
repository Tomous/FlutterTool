// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  /// 用户id
  String? id;
  // ignore: non_constant_identifier_names
  String? course_count_text;

  /// 粉丝数
  // ignore: non_constant_identifier_names
  String? followers_count_text;
  // ignore: non_constant_identifier_names
  bool? is_prime;

  /// 用户名字
  String? n;

  /// 用户头像
  String? p;
  // ignore: non_constant_identifier_names
  String? verified_image;

  /// 菜谱数量
  // ignore: non_constant_identifier_names
  String? recipes_count_text;

  /// lv 级别
  int? lv;

  /// lvl
  int? lvl;

  /// 用户头像
  // ignore: non_constant_identifier_names
  String? avatar_medium;

  /// 用户小头像
  // ignore: non_constant_identifier_names
  String? user_photo;

  /// 用户名字
  String? nick;

  /// 用户名字
  String? nickname;

  /// 用户id
  // String? user_id;

  // /// 用户电话
  // String? phoneNum;
  // /// 用户密码
  // String? codeNum;
  // /// 用户名字
  // String? nickName;
  // /// 用户性别
  // String? sex;
  // /// 用户生日
  // String? birthday;
  // /// 用户职业
  // String? profession;
  // /// 用户家乡
  // String? hometown;
  // /// 用户签名
  // String? signature;

  UserModel(
      this.id,
      this.course_count_text,
      this.followers_count_text,
      this.n,
      this.p,
      this.verified_image,
      this.is_prime,
      this.recipes_count_text,
      this.lv,
      this.lvl,
      this.avatar_medium,
      this.nick,
      this.nickname,
      this.user_photo);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
