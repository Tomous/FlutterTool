import 'dart:typed_data';

import 'package:date_format/date_format.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/constants/consts.dart';
import 'package:firstapp/pages/home/pages/home_first/pages/signature_draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({super.key});

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage> {
  Uint8List? _signatureImage;
  final RxString _signatureTime = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 40.0,
                  height: 30.0,
                  child: Icon(
                    Icons.task_alt_rounded,
                    color: Colors.blue,
                  ),
                ),
                const Expanded(child: Divider(color: Colors.grey)),
                const SizedBox(
                  width: 40.0,
                  height: 30.0,
                  child: Icon(
                    Icons.radio_button_checked,
                    color: Colors.blue,
                  ),
                ),
                const Expanded(child: Divider(color: Colors.grey)),
                SizedBox(
                  width: 40,
                  height: 30,
                  child: Icon(
                    Icons.radio_button_off,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('出行预约', style: TextStyle(fontSize: 13)),
                Text(
                  '承诺签约',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '提交审核',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: Text(
              '承诺签署',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.text2,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              border: Border.all(
                color: AppColors.text6.withAlpha(80),
                width: 1,
              ),
            ),
            //RawScrollbar--侧边显示一个原始滚动条
            child: RawScrollbar(
              radius: const Radius.circular(6),
              thumbColor: AppColors.text6.withAlpha(100),
              crossAxisMargin: 3,
              thickness: 3,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    StorageKeys.SIGNATUREFILE,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: AppColors.text3),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Text(
              '承诺签署人：',
              style: TextStyle(
                color: AppColors.text4,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          //边框
          DottedBorder(
            borderType: BorderType.RRect,
            color: AppColors.text6.withAlpha(100),
            radius: const Radius.circular(8.0),
            child: InkWell(
              child: SizedBox(
                height: 110.0,
                child: _signatureImage != null
                    ? Image.memory(
                        _signatureImage!,
                        width: double.infinity,
                        height: double.infinity,
                      )
                    : Center(
                        child: Text(
                          '点击签名',
                          style: TextStyle(
                            fontSize: 30,
                            color: AppColors.text6.withAlpha(70),
                          ),
                        ),
                      ),
              ),
              onTap: () async {
                var result = await Get.to(const SignatureDrawPage());
                print("result: $result");
                if (result == null) return;
                setState(() {
                  _signatureImage = result.buffer.asUint8List();
                });
                _signatureTime.value = formatDate(
                  DateTime.now(),
                  [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss],
                );
              },
            ),
          ),
          const Divider(height: 20),
          SizedBox(
            width: double.infinity,
            child: Obx(
              () => Text(
                '签署时间：${_signatureTime.value}',
                style: TextStyle(
                  color: AppColors.text4,
                ),
              ),
            ),
          ),
          const Divider(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () => EasyLoading.showToast('点击了提交按钮'),
              child: const Text('提交审核'),
            ),
          ),
        ],
      ),
    );
  }
}
