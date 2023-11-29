import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';

class MukGenButton extends StatefulWidget {
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
  State<MukGenButton> createState() => _MukGenButtonState();
}

class _MukGenButtonState extends State<MukGenButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width.w,
      height: widget.height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: widget.outlineColor != null && widget.outlineWidth != null
              ? BorderSide(
                  color: widget.outlineColor!,
                  width: widget.outlineWidth!.w,
                )
              : BorderSide.none,
        ),
        onPressed: () {
          if (widget.onPressed != null) widget.onPressed!();
        },
        child: Center(
          child: widget.text,
        ),
      ),
    );
  }
}
