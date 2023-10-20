import 'package:dotted_border/dotted_border.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';

class SignatureDrawPage extends StatefulWidget {
  const SignatureDrawPage({super.key});

  @override
  State<SignatureDrawPage> createState() => _SignatureDrawPageState();
}

class _SignatureDrawPageState extends State<SignatureDrawPage> {
  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: RotatedBox(
          quarterTurns: 45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 20,
                    ),
                    const Text('签署合约'),
                  ],
                ),
                Expanded(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: AppColors.text6.withAlpha(150),
                    strokeWidth: 1,
                    radius: const Radius.circular(10),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            '签名区',
                            style: TextStyle(
                              fontSize: 70,
                              color: AppColors.text6.withAlpha(60),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: HandSignature(
                            control: control,
                            color: Colors.black,
                            width: 1,
                            maxWidth: 10,
                            type: SignatureDrawType.shape,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        child: const Text('确定'),
                        onPressed: () {
                          final png = control.toImage();
                          Get.back(result: png);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 150,
                      child: OutlinedButton(
                        onPressed: () {
                          control.clear();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade400),
                        ),
                        child: const Text('重签'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
