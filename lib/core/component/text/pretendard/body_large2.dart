import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';

class BodyLarge2 extends StatelessWidget {
  final CustomText customText;

  const BodyLarge2({super.key, required this.customText});

  @override
  Widget build(BuildContext context) {
    return Text(
      customText.text,
      style: TextStyle(
        color: customText.color,
        fontSize: 16.sp,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w600,
      ),
      textAlign: customText.textAlign,
    );
  }
}