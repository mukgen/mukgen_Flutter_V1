import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';

class EmailConfirmTextField extends StatefulWidget {
  const EmailConfirmTextField({
    super.key,
    required FocusNode focusNode,
    required TextEditingController controller,
    this.nextFocusNode,
    this.autofocus,
  })  : _focusNode = focusNode,
        _controller = controller;

  final FocusNode _focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController _controller;
  final bool? autofocus;

  @override
  State<EmailConfirmTextField> createState() => _EmailConfirmTextFieldState();
}

class _EmailConfirmTextFieldState extends State<EmailConfirmTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 51.17.w,
        height: 56.0.h,
        decoration: BoxDecoration(
          color: widget._focusNode.hasFocus ? MukGenColor.pointLight4 : null,
          border: Border.all(
            color: widget._focusNode.hasFocus || widget._controller.text.isNotEmpty
                    ? MukGenColor.pointBase
                    : MukGenColor.primaryLight2,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: TextFormField(
          focusNode: widget._focusNode,
          controller: widget._controller,
          autofocus: widget.autofocus ?? false,
          maxLength: 1,
          textAlign: TextAlign.center,
          cursorColor: MukGenColor.black,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (widget.nextFocusNode == null && widget._controller.text.isNotEmpty) {
              FocusScope.of(context).unfocus();
            } else if (value.isNotEmpty) {
              widget.nextFocusNode?.requestFocus();
            }
          },
          style: TextStyle(
            color: MukGenColor.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
