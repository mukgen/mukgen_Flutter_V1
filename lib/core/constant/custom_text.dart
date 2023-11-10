import 'package:flutter/material.dart';

class CustomText {
  final String text;
  final Color color;

  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const CustomText({
    required this.text,
    required this.color,
    this.textAlign,
    this.textOverflow,
  });
}
