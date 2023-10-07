// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    json['i'] as String?,
    json['id'] as int?,
    json['t'] as String?,
    json['url'] as String?,
    json['name'] as String?,
    json['nickname'] as String?,
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'i': instance.i,
      'id': instance.id,
      't': instance.t,
      'url': instance.url,
      'name': instance.name,
      'nickname': instance.nickname,
    };
