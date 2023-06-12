import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MukGenButton extends StatelessWidget {
  const MukGenButton({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.fontSize,
    required this.textColor,
    this.outlineColor,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final double width, height, fontSize;
  final Color backgroundColor, textColor;
  final Color? outlineColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: outlineColor != null // 외곽선 색상이 지정된 경우에만 설정
              ? BorderSide(
                  color: outlineColor!,
                  width: 2.0,
                )
              : BorderSide.none,
        ),
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'MukgenSemiBold',
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
