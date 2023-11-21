import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';

class MukGenButton extends StatelessWidget {
  const MukGenButton({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
    this.outlineColor,
    this.outlineWidth,
    this.onPressed,
  }) : super(key: key);

  final Text text;
  final double width, height;
  final Color backgroundColor;
  final Color? outlineColor;
  final VoidCallback? onPressed;
  final double? outlineWidth;

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
          side: outlineColor != null && outlineWidth != null
              ? BorderSide(
                  color: outlineColor!,
                  width: outlineWidth!.w,
                )
              : BorderSide.none,
        ),
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
