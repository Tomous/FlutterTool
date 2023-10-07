import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppDialog {
  /// iOS 风格提示框
  static void showIOSDialog(
    BuildContext context, {
    String title = "温馨提示",
    required String content,
    String leftText = "取消",
    String rightText = "确定",
    required final Function onCancle,
    required final Function onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w200),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: const Alignment(0, 0),
                child: Text(content),
              )
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(leftText),
              onPressed: () {
                Navigator.pop(context);
                onCancle();
              },
            ),
            CupertinoDialogAction(
              child: Text(rightText),
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }

  /// 安卓 风格提示框
  static void showAnAlert(
    BuildContext context, {
    String title = "温馨提示",
    required String content,
    String leftText = "取消",
    String rightText = "确认",
    required final Function onCancel,
    required final Function onConfirm,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: Text(leftText),
                onPressed: () {
                  Navigator.pop(context);
                  onCancel();
                },
              ),
              TextButton(
                child: Text(rightText),
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
              ),
            ],
          );
        });
  }

  /// 提示文字
  static void showText(
    BuildContext context, {
    required String title,
    double textFont = 14.0,
  }) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: textFont,
    );
  }

  /// 一个按钮
  static void showOneBtnAlert(
    BuildContext context, {
    String title = "温馨提示",
    required String content,
    String rightText = "确认",
    required final Function onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          contentPadding: EdgeInsets.zero,
          children: [
            const Divider(height: 1),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: Container(
                width: 100,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  rightText,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 自定义弹窗
  static void showCusoumAlert(
    BuildContext context, {
    String title = "温馨提示",
    required String content,
    String leftText = "取消",
    String rightText = "确认",
    required final Function onCancel,
    required final Function onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
          title: Center(
            child: Text(title),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          children: [
            const Divider(height: 1),
            Container(
              alignment: Alignment.center,
              height: 80,
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xffFF4B38),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        '否',
                        style: TextStyle(
                          color: Color(0xffFF4B38),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextButton(
                    onPressed: () {
                      onCancel();
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffFF4B38),
                        // border: Border.all(color: Color(0xffFF4B38),width: 1),
                      ),
                      child: const Text(
                        '是',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  /// 底部弹出
  static void showBottomSheet(
    BuildContext context, {
    String title = "温馨提示",
    required String content,
    String leftText = "取消",
    String rightText = "确认",
    required final Function onCancel,
    required final Function onConfirm,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("设置"),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("主页"),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text("信息"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
