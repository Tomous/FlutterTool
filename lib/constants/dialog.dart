import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/constants/consts.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends Dialog {
  final String? title;
  final String? content;
  final Widget? contentWidget;
  final bool? backMiss;
  final bool? centerContent;
  final String? cancelText;
  final String? okText;
  final Color? okTextColor;
  final Color? cancelTexColor;
  final void Function()? onOk;
  final void Function()? onCancel;

  const ConfirmDialog({
    Key? key,
    this.title,
    this.content,
    this.contentWidget,
    this.cancelText,
    this.okText,
    this.okTextColor,
    this.cancelTexColor,
    this.backMiss = true,
    this.centerContent = true,
    this.onOk,
    this.onCancel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.75;
    double height = size.height * 0.5;

    return GestureDetector(
      onTap: () {
        if (backMiss == true) {
          if (onCancel != null) {
            onCancel!();
          }
          Navigator.of(context).pop();
        }
      },
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: width > 350 ? 350 : width,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: TextStyle(
                                color: AppColors.text2,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          if (title != null &&
                              (content != null || contentWidget != null))
                            const SizedBox(height: 15),
                          if (content != null || contentWidget != null)
                            contentWidget ??
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: height,
                                  ),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Text(
                                      content!,
                                      textAlign: centerContent == true
                                          ? TextAlign.center
                                          : null,
                                      style: TextStyle(
                                          fontSize: 15, color: AppColors.text4),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    divider,
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          if (onCancel != null)
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  onCancel!();
                                },
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 48),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  shape: const RoundedRectangleBorder(),
                                  foregroundColor:
                                      cancelTexColor ?? AppColors.text3,
                                ),
                                child: Text(cancelText ?? '取消'),
                              ),
                            ),
                          if (onCancel != null)
                            VerticalDivider(
                              width: 0,
                              color: AppColors.text6.withAlpha(150),
                              thickness: 0.3,
                            ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                if (onOk != null) {
                                  onOk!();
                                }
                              },
                              style: TextButton.styleFrom(
                                minimumSize: const Size(double.infinity, 48),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                textStyle: const TextStyle(fontSize: 16),
                                shape: const RoundedRectangleBorder(),
                                foregroundColor: okTextColor ?? Colors.blue,
                              ),
                              child: Text(okText ?? '确认'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends Dialog {
  @override
  // ignore: overridden_fields
  final Widget? child;
  final void Function()? onCancel;

  const CustomDialog({
    Key? key,
    this.child,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.75;
    return GestureDetector(
      onTap: () {
        if (onCancel != null) {
          onCancel!();
        }
        Navigator.of(context).pop();
      },
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: width > 350 ? 350 : width,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
