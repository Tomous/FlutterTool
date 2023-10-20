// To parse this JSON data, do
//
//     final teachingData = teachingDataFromJson(jsonString);

import 'dart:convert';

TeachingData teachingDataFromJson(String str) =>
    TeachingData.fromJson(json.decode(str));

String teachingDataToJson(TeachingData data) => json.encode(data.toJson());

class TeachingData {
  int id;
  int isOnline;
  int isToped;
  String trainType;
  String trainTitle;
  String trainPic;
  String trainEntity;
  String trainVideo;
  String userAccount;
  dynamic topedTime;
  DateTime createTime;
  DateTime updateTime;
  int deleted;

  TeachingData({
    required this.id,
    required this.isOnline,
    required this.isToped,
    required this.trainType,
    required this.trainTitle,
    required this.trainPic,
    required this.trainEntity,
    required this.trainVideo,
    required this.userAccount,
    required this.topedTime,
    required this.createTime,
    required this.updateTime,
    required this.deleted,
  });

  factory TeachingData.fromJson(Map<String, dynamic> json) => TeachingData(
        id: json["id"],
        isOnline: json["is_online"],
        isToped: json["is_toped"],
        trainType: json["train_type"],
        trainTitle: json["train_title"],
        trainPic: json["train_pic"],
        trainEntity: json["train_entity"],
        trainVideo: json["train_video"],
        userAccount: json["user_account"],
        topedTime: json["toped_time"],
        createTime: DateTime.parse(json["create_time"]),
        updateTime: DateTime.parse(json["update_time"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_online": isOnline,
        "is_toped": isToped,
        "train_type": trainType,
        "train_title": trainTitle,
        "train_pic": trainPic,
        "train_entity": trainEntity,
        "train_video": trainVideo,
        "user_account": userAccount,
        "toped_time": topedTime,
        "create_time": createTime.toIso8601String(),
        "update_time": updateTime.toIso8601String(),
        "deleted": deleted,
      };
}
