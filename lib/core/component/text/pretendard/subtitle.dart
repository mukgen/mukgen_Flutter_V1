import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';

class Subtitle extends StatelessWidget {
  final CustomText customText;

  const Subtitle({super.key, required this.customText});

  @override
  Widget build(BuildContext context) {
    return Text(
      customText.text,
      style: TextStyle(
        color: customText.color,
        fontSize: 20.sp,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
      ),
      textAlign: customText.textAlign,
    );
  }
}