import 'package:flutter/material.dart';

import '../constants/constants.dart';

class RefreshLoading extends StatelessWidget {
  const RefreshLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: AppColors.yellow,
        ),
      ),
    );
  }
}
