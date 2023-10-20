// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cook_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CookInfoModel _$CookInfoModelFromJson(Map<String, dynamic> json) {
  return CookInfoModel(
    json['id'] as int?,
    json['act'] as String?,
    json['like_state'] as int?,
    json['media_type'] as int?,
    json['vc'] as String?,
    json['video_url'] as String?,
    json['views'] as String?,
    json['views_count_text'].toString(),
    json['t'] as String?,
    json['time'].toString(),
    json['trim_title'] as String?,
    json['collect_count_text'].toString(),
    (json['collect_users'] as List<dynamic>?)
        ?.map((e) => CollectionUserModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['comments_count'] as int?,
    json['item_id'] as int?,
    json['ph'].toString(),
    json['pw'].toString(),
    json['n'] as String?,
    json['u'] == null
        ? null
        : UserModel.fromJson(json['u'] as Map<String, dynamic>),
    json['fc'] as int?,
    json['img'] as String?,
    json['collect_status'] as int?,
    json['a'] == null
        ? null
        : UserModel.fromJson(json['a'] as Map<String, dynamic>),
    json['gif'] as String?,
    json['vfurl'] as String?,
    json['vu'] as String?,
    json['cook_id'] as int?,
    json['is_video'] as bool?,
    (json['recipe_list_tags'] as List<dynamic>?)
        ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['recommend_label'] as String?,
    json['is_select'] as bool?,
    json['nickName'] as String?,
    json['nickIcon'] as String?,
    json['videoUrl'] as String?,
  );
}

Map<String, dynamic> _$CookInfoModelToJson(CookInfoModel instance) =>
    <String, dynamic>{
      'act': instance.act,
      'collect_count_text': instance.collect_count_text,
      'collect_users': instance.collect_users,
      'comments_count': instance.comments_count,
      'fc': instance.fc,
      'id': instance.id,
      'img': instance.img,
      'item_id': instance.item_id,
      'like_state': instance.like_state,
      'collect_status': instance.collect_status,
      'media_type': instance.media_type,
      'n': instance.n,
      'ph': instance.ph,
      'pw': instance.pw,
      't': instance.t,
      'time': instance.time,
      'trim_title': instance.trim_title,
      'vc': instance.vc,
      'views': instance.views,
      'video_url': instance.video_url,
      'views_count_text': instance.views_count_text,
      'u': instance.u,
      'a': instance.a,
      'gif': instance.gif,
      'vfurl': instance.vfurl,
      'vu': instance.vu,
      'cook_id': instance.cook_id,
      'is_video': instance.is_video,
      'recipe_list_tags': instance.recipe_list_tags,
      'recommend_label': instance.recommend_label,
      'is_select': instance.is_select,
      'nickName': instance.nickName,
      'nickIcon': instance.nickIcon,
      'videoUrl': instance.videoUrl,
    };
