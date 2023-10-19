import 'package:firstapp/constants/common.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/constants/consts.dart';
import 'package:firstapp/constants/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          const FormItem(label: "手机号", value: "17600907892"),
          divider,
          const FormItem(label: "用户名", value: "17600907892"),
          divider,
          FormItem(
            label: '密码设置',
            more: true,
            onPressed: () {
              Fluttertoast.showToast(msg: "密码设置");
            },
          ),
          divider,
          FormItem(
            label: '人脸登录设置',
            more: true,
            onPressed: () {
              Fluttertoast.showToast(msg: "人脸登录设置");
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              '语音唤醒设置',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          FormItem(
            label: '开启语音唤醒',
            subLabel: '开启后将会开启麦克风，直到您在此关闭',
            input: CupertinoSwitch(
              value: switch1,
              activeColor: Colors.blue,
              onChanged: (val) {
                setState(() {
                  switch1 = val;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              '出行提醒设置',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          FormItem(
            label: '提前一天',
            input: CupertinoSwitch(
              value: switch3,
              activeColor: Colors.blue,
              onChanged: (val) {
                setState(() {
                  switch3 = val;
                });
              },
            ),
          ),
          divider,
          FormItem(
            label: '提前三小时',
            input: CupertinoSwitch(
              value: switch2,
              activeColor: Colors.blue,
              onChanged: (val) {
                setState(() {
                  switch2 = val;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          FormItem(
            label: '注销账号',
            more: true,
            onPressed: (() => Fluttertoast.showToast(msg: "注销账号")),
          ),
          divider,
          FormItem(
            label: '关于',
            value: '版本 1.0.0',
            more: true,
            onPressed: () => (Fluttertoast.showToast(msg: "关于")),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LargeButton(
              '退出登录',
              color: Colors.blue,
              onPressed: () => _signoutConfirm(),
            ),
          ),
        ],
      ),
    );
  }

  void _signoutConfirm() {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: '退出登录',
          content: '您确定要退出当前账号吗？',
          okText: '退出登录',
          okTextColor: Colors.red,
          onCancel: () => Navigator.of(context).pop(),
          onOk: () {
            Fluttertoast.showToast(msg: "退出登录");
          },
        );
      },
    );
  }
}

class FormItem extends StatelessWidget {
  final bool? required;
  final String label;
  final String? subLabel;
  final String? value;
  final bool? more;
  final Widget? input;
  final String? hint;
  final double? height;
  final double? fontSize;
  final double? padding;
  final void Function()? onPressed;
  const FormItem({
    super.key,
    this.required,
    required this.label,
    this.subLabel,
    this.value,
    this.more,
    this.input,
    this.hint,
    this.height,
    this.fontSize = 16,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        overlayColor: MaterialStateProperty.all(Colors.blue.shade50),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height ?? 56,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  required == true ? '*' : '',
                  style: const TextStyle(color: Colors.red),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style:
                          TextStyle(fontSize: fontSize, color: AppColors.text4),
                    ),
                    if (subLabel?.isNotEmpty == true)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          subLabel!,
                          style:
                              TextStyle(fontSize: 11, color: AppColors.text5),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: input ??
                        Text(
                          value ?? hint ?? '',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: value == null
                                ? AppColors.text6
                                : AppColors.text2,
                          ),
                        ),
                  ),
                ),
                if (more == true)
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.text6,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
