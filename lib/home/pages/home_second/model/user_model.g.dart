// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['id'].toString(),
    json['course_count_text'].toString(),
    json['followers_count_text'].toString(),
    json['n'] as String?,
    json['p'] as String?,
    json['verified_image'] as String?,
    json['is_prime'] as bool?,
    json['recipes_count_text'].toString(),
    json['lv'] as int?,
    json['lvl'] as int?,
    json['avatar_medium'] as String?,
    json['nick'] as String?,
    json['nickname'] as String?,
    // json['user_id'] as String?,
    json['user_photo'] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'course_count_text': instance.course_count_text,
      'followers_count_text': instance.followers_count_text,
      'is_prime': instance.is_prime,
      'n': instance.n,
      'p': instance.p,
      'verified_image': instance.verified_image,
      'recipes_count_text': instance.recipes_count_text,
      'lv': instance.lv,
      'lvl': instance.lvl,
      'avatar_medium': instance.avatar_medium,
      'user_photo': instance.user_photo,
      'nick': instance.nick,
      'nickname': instance.nickname,
      // 'user_id': instance.user_id,
    };
