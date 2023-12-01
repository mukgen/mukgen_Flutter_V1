import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/view/sign_in_page.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_confirm_page.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_input_page.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_main_page.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_name_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        backgroundColor: MukGenColor.primaryLight3,
        body: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/logo/mukgen3.png',
                width: 160.0.w,
                height: 189.0.w,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: MukGenColor.white,
              height: 192.0.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24.h),
                    child: MukGenButton(
                      width: 353,
                      height: 55,
                      backgroundColor: MukGenColor.primaryLight3,
                      text: PtdTextWidget.bodyLarge2(
                        '로그인',
                        MukGenColor.black,
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 34.h),
                    child: MukGenButton(
                        width: 353,
                        height: 55,
                        backgroundColor: MukGenColor.pointLight1,
                        text: PtdTextWidget.bodyLarge2(
                          '시작하기',
                          MukGenColor.white,
                        ),
                        onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignUpMainPage(),
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
