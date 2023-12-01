import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_input_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';

class SignUpMainPage extends StatelessWidget {
  const SignUpMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(59.h),
        child: AppBar(
          backgroundColor: MukGenColor.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: MukGenColor.primaryLight1,
              size: 24.sp,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            PtdTextWidget.title(
              '시작하기',
              MukGenColor.black,
            ),
            SizedBox(height: 24.h),
            PtdTextWidget.bodyLarge(
              '먹젠과 함께 학교에서 즐거운 식생활을 누려보세요.',
              MukGenColor.black,
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/SignUpMukgen.png',
                  width: 160.w,
                  height: 160.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 34.h),
              child: MukGenButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpEmailInputPage()));
                },
                text: PtdTextWidget.bodyLarge2(
                  '시작하기',
                  MukGenColor.white,
                ),
                width: 353,
                height: 55,
                backgroundColor: MukGenColor.primaryBase,
              ),
            ),
          ],
        ),
      ),
    );
  }
}