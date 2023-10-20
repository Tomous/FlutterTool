// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionUserModel _$CollectionUserModelFromJson(Map<String, dynamic> json) {
  return CollectionUserModel(
    json['id'] as int,
    json['is_prime'] as bool,
    json['n'] as String,
    json['p'] as String,
    json['verified_image'] as String,
  );
}

Map<String, dynamic> _$CollectionUserModelToJson(
        CollectionUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_prime': instance.is_prime,
      'n': instance.n,
      'p': instance.p,
      'verified_image': instance.verified_image,
    };
