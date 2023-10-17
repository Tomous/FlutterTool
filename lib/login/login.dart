import 'package:firstapp/constants/account.dart';
import 'package:firstapp/constants/common.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _ischecked = false;
  bool _loading = false;
  final _usernameTEC = TextEditingController();
  final _passwordTEC = TextEditingController();
  @override
  void initState() {
    super.initState();
    Account.getLastAccount().then((info) {
      _usernameTEC.text = info?['username'] ?? '';
    });
  }

  void _submit() async {
    String username = _usernameTEC.text;
    String password = _passwordTEC.text;
    if (username.isEmpty) {
      // return EasyLoading.showToast('请输入用户名');
      Get.snackbar("提示", "请输入用户名");
      return;
    }
    if (password.isEmpty) {
      return EasyLoading.showToast("请输入密码");
    }
    try {
      setState(() => _loading = true);
      // final account = Account.current;
      // if (await account.checkIsNeedCaptcha(username: username)) {
      //   await captcha(username: username);
      // }
      // await Account.current.signinWithPassword(username, password);
      // context.go('/?index=0');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _usernameTEC.dispose();
    _passwordTEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameTEC,
              decoration: const InputDecoration(labelText: '用户名'),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            PasswordInput(
              controller: _passwordTEC,
              label: '密码',
            ),
            const SizedBox(height: 30),
            LargeButton('登录',
                onPressed: _ischecked && !_loading ? _submit : null),
            CheckAgreement(
              value: _ischecked,
              onChanged: (v) {
                setState(() {
                  _ischecked = v ?? false;
                });
              },
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                // to(context, (_) => const PageForgetPassword());
              },
              child: const Text(
                '忘记密码',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String? hint;
  final String? label;
  final TextAlign? textAlign;
  final double? fontSize;
  final TextEditingController? controller;
  const PasswordInput({
    super.key,
    this.hint,
    this.label,
    this.textAlign,
    this.fontSize,
    this.controller,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            obscureText: !visible,
            // autofocus: true,
            textAlign: widget.textAlign ?? TextAlign.start,
            decoration: widget.label != null
                ? InputDecoration(
                    labelText: widget.label,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: Icon(
                        visible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  )
                : InputDecoration.collapsed(
                    hintText: widget.hint ?? '',
                    hintStyle: TextStyle(color: AppColors.text6),
                  ),
            style: TextStyle(fontSize: widget.fontSize ?? 16),
          ),
        ),
        if (widget.label == null)
          IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(
              visible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.text5,
              size: 20,
            ),
          )
      ],
    );
  }
}

// 同意协议
class CheckAgreement extends StatelessWidget {
  const CheckAgreement({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '我已阅读并同意',
            style: TextStyle(color: AppColors.text5, fontSize: 12),
          ),
          TextButton(
            onPressed: () {
              // context.push('/webview?url=$serviceDocUrl&title=用户服务协议');
            },
            // ignore: sort_child_properties_last
            child: const Text(
              '《用户服务协议》',
              style: TextStyle(fontSize: 12),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            ),
          ),
          TextButton(
            onPressed: () {
              // context.push('/webview?url=$privacyDocUrl&title=隐私政策');
            },
            child: const Text(
              '《隐私政策》',
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
