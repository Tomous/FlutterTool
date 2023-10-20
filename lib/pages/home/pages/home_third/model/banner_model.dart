// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

/// 列表模型数组
class BannerModelList {
  List<BannerModel> list;
  BannerModelList(this.list);
  factory BannerModelList.fromJson(List<dynamic> list) {
    return BannerModelList(
      list.map((item) => BannerModel.fromJson(item)).toList(),
    );
  }
}

@JsonSerializable()
class BannerModel {
  /// 图片
  String? i;

  /// 资讯信息id
  int? id;

  /// 文字描述
  String? t;

  /// H5连接
  String? url;

  /// 活动名称
  String? name;

  /// 作者名字
  String? nickname;

  BannerModel(this.i, this.id, this.t, this.url, this.name, this.nickname);
  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
