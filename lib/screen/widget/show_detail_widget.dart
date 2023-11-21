import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/custom_text.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/widget/comment_icon.dart';
import 'package:mukgen_flutter_v1/screen/widget/custom_icons.dart';

enum IconType { like, comment, view }

class ShowDetailWidget extends StatelessWidget {
  final IconType type;
  final String text;
  final double iconSize;

  const ShowDetailWidget({
    required this.text,
    required this.type,
    required this.iconSize,
    super.key,
  });

  IconData _getIconData() {
    switch (type) {
      case IconType.like:
        return CupertinoIcons.heart_fill;
      case IconType.view:
        return Icons.remove_red_eye;
      case IconType.comment:
        return CommentIcon.commentCount;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          _getIconData(),
          size: iconSize.sp,
          color: MukGenColor.primaryLight2,
        ),
        SizedBox(width: 4.w),
        PtdTextWidget.body2(
          text,
          MukGenColor.primaryLight2,
        ),
      ],
    );
  }
}
