import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';

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
