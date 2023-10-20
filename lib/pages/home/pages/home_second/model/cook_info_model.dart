import 'package:json_annotation/json_annotation.dart';
import 'collect_users_model.dart';
import 'user_model.dart';
import '../model/recipe_list_model.dart';
part 'cook_info_model.g.dart';

/// 列表模型数组
class CookInfoModelList {
  List<CookInfoModel> list;
  CookInfoModelList(this.list);
  factory CookInfoModelList.fromJson(List<dynamic> list) {
    return CookInfoModelList(
      list.map((item) => CookInfoModel.fromJson(item)).toList(),
    );
  }
}

@JsonSerializable()
class CookInfoModel {
  /// 发布时间
  String? act;

  /// 收藏人数
  // ignore: non_constant_identifier_names
  String? collect_count_text;

  /// 用户头像列表
  // ignore: non_constant_identifier_names
  List<CollectionUserModel>? collect_users;

  /// 评论条数
  // ignore: non_constant_identifier_names
  int? comments_count;

  /// 评论条数字符串
  // String? comments_count_text;
  /// 用户评论列表
  // List<CommentsListModel> comments_list;
  int? fc;

  /// 资讯信息id
  int? id;

  /// 图片
  String? img;
  // ignore: non_constant_identifier_names
  int? item_id;

  /// 是否喜欢 0 未喜欢 1 喜欢
  // ignore: non_constant_identifier_names
  int? like_state;

  /// 是否收藏 0 未收藏 1 收藏
  // ignore: non_constant_identifier_names
  int? collect_status;

  /// 类型
  // ignore: non_constant_identifier_names
  int? media_type;

  /// 描述文字
  String? n;

  /// 图片高度
  String ph;

  /// 图片宽度
  String pw;
  String? t;

  /// 发布时间
  String? time;
  // ignore: non_constant_identifier_names
  String? trim_title;
  // int? type;
  String? vc;
  String? views;

  /// 视频播放地址
  // ignore: non_constant_identifier_names
  String? video_url;

  /// 浏览数量
  // ignore: non_constant_identifier_names
  String? views_count_text;

  /// 作者信息
  UserModel? u;

  /// 作者信息
  UserModel? a;

  /// 动态图
  String? gif;

  /// 视频url
  String? vfurl;

  /// 视频url
  String? vu;

  /// 做饭id
  // ignore: non_constant_identifier_names
  int? cook_id;

  /// 是否是视频
  // ignore: non_constant_identifier_names
  bool? is_video;
  // ignore: non_constant_identifier_names
  List<RecipeModel>? recipe_list_tags;

  /// 多少人看过
  // ignore: non_constant_identifier_names
  String? recommend_label;

  /// 是否缓存过
  // ignore: non_constant_identifier_names
  bool? is_select;

  /// 用户名字
  String? nickName;

  /// 用户头像
  String? nickIcon;

  /// 视频播放地址
  String? videoUrl;
  CookInfoModel(
      this.id,
      this.act,
      this.like_state,
      this.media_type,
      this.vc,
      this.video_url,
      this.views,
      this.views_count_text,
      this.t,
      this.time,
      this.trim_title,
      this.collect_count_text,
      this.collect_users,
      this.comments_count,
      this.item_id,
      this.ph,
      this.pw,
      this.n,
      this.u,
      this.fc,
      this.img,
      this.collect_status,
      this.a,
      this.gif,
      this.vfurl,
      this.vu,
      this.cook_id,
      this.is_video,
      this.recipe_list_tags,
      this.recommend_label,
      this.is_select,
      this.nickName,
      this.nickIcon,
      this.videoUrl);
  factory CookInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CookInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CookInfoModelToJson(this);
}
