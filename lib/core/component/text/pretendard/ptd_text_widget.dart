import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String pretendard = 'Pretendard';

class PtdTextWidget {
  PtdTextWidget._();

  static Text body(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 12.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static Text body2(String text, Color color, {TextOverflow? overflow}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w400,
      ),
      overflow: overflow,
    );
  }

  static Text bodyStrong(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 12.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text bodyStrong2(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text bodyLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static Text bodyLarge2(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text subtitle(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text title(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text titleLarge(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 40.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text titleLarge2(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 48.sp,
        fontFamily: pretendard,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
