import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class MukGenTextField extends StatefulWidget {
  const MukGenTextField({
    Key? key,
    required this.width,
    required this.controller,
    required this.fontSize,
    required this.isPwdTextField,
    required this.maxLength,
    required this.autofocus,
    this.nextFocusNode,
    this.focusNode,
    this.height,
    this.hintText,
    this.helperText,
    this.textAlign,
    this.textInputType,
    this.color
  }) : super(key: key);

  final double width;
  final double? height;

  final Color? color;

  final int? maxLength;
  final int fontSize;
  final TextEditingController controller;
  final String? hintText, helperText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final bool isPwdTextField;
  final bool autofocus;

  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;

  @override
  State<MukGenTextField> createState() => _MukGenTextFieldState();
}

class _MukGenTextFieldState extends State<MukGenTextField> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return widget.isPwdTextField
        ? SizedBox(
            width: widget.width.w,
            height: widget.height != null ? widget.height!.h : null,
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) => setState(() {}),
              maxLength: widget.maxLength,
              autofocus: widget.autofocus,
              textAlign: widget.textAlign != null
                  ? widget.textAlign!
                  : TextAlign.start,
              keyboardType: widget.textInputType,
              cursorColor: MukGenColor.black,
              obscureText: !_isClicked,
              obscuringCharacter: '*',
              style: TextStyle(
                fontSize: widget.fontSize.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
              decoration: InputDecoration(
                counterText: '',
                helperText: widget.helperText,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: widget.fontSize.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                helperStyle: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'MukgenRegular',
                  color: widget.color,
                ),
                enabledBorder: widget.controller.text.isEmpty
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: MukGenColor.primaryLight2, width: 2))
                    : UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.black, width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: MukGenColor.pointBase, width: 2)),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.remove_red_eye_rounded,
                    color: _isClicked
                        ? MukGenColor.pointLight1
                        : MukGenColor.primaryLight1,
                  ),
                  onTap: () {
                    setState(() {
                        _isClicked ? _isClicked = false : _isClicked = true;
                      },
                    );
                  },
                ),
              ),
            ),
          )
        : SizedBox(
            width: widget.width.w,
            height: widget.height != null ? widget.height!.h : null,
            child: TextFormField(
              controller: widget.controller,
              autofocus: widget.autofocus,
              keyboardType: widget.textInputType,
              focusNode: widget.focusNode,
              textAlign: widget.textAlign != null
                  ? widget.textAlign!
                  : TextAlign.start,
              onChanged: (value) => setState(() {
                if (widget.nextFocusNode == null && widget.controller.text.length == widget.maxLength){
                  FocusScope.of(context).unfocus();
                } else if (value.length == widget.maxLength) {
                  widget.nextFocusNode?.requestFocus();
                }
              }),
              maxLength: widget.maxLength,
              cursorColor: MukGenColor.black,
              style: TextStyle(
                fontSize: widget.fontSize.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: widget.hintText,
                helperText: widget.helperText,
                hintStyle: TextStyle(
                  fontSize: widget.fontSize.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                helperStyle: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'MukgenRegular',
                  color: widget.color,
                ),
                enabledBorder: widget.controller.text.isEmpty
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: MukGenColor.primaryLight2, width: 2))
                    : UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.black, width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: MukGenColor.pointBase, width: 2)),
              ),
            ),
          );
  }
}
