import 'package:flutter/material.dart';

class StorageKeys {
  // 登录失败次数
  static String SIGNIN_FAILED_TIMES = 'signin_failed_times';
  // 是否同意用户协议和隐私政策
  static String AGREE_TERMS = 'agreeTerms';
  // 位置缓存
  static String LOCATION = 'location';
  // token
  static String TOKEN = 'token';
  static String REFRESH_TOKEN = 'refresh_token';
  // 上次登录用户名
  static String LAST_ACCOUNT = 'last_account';
  // 是否已请求位置权限
  // static String LOCATION_PERMISSION_REQUESTED = 'location_permission_requested';
  // 历史位置搜索记录
  static String LOCATION_SEARCH_HISTORY = 'location_search_history_1';
  // 跳过升级的版本
  static String SKIP_UPGRADE_VERSION = 'skip_upgrade_version';
  // 上次公告更新时间，用来判断是否显示公告
  static String NOTICE_UPDATE_TIME = 'notice_update_time';
  // 是否开启语音唤醒
  static String VOICE_WAKE_UP_ENABLE = 'voice_wake_up_enable';

  //承诺签署协议
  static String SIGNATUREFILE =
      '为了保证您在签署协议过程中，所签署的协议内容准确无误，请您仔细阅读本协议并确保您已充分理解本协议各条款。\n\n1. 签署本协议即表示您同意并接受本协议的全部内容。\n2. 签署本协议即表示您同意并接受本协议的全部内容。\n3. 签署本协议即表示您同意并接受本协议的全部内容。\n4. 签署本协议即表示您同意并接受本协议的全部内容。\n5. 签署本协议即表示您同意并接受本协议的全部内容。\n6. 签署本协议即表示您同意并接受本协议的全部内容。';
}

const Divider divider = Divider(
    height: 0, color: Color.fromARGB(255, 206, 210, 213), thickness: 0.3);
