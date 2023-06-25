import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/screen/auth/login_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: MukGenColor.primaryLight3,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 235.5.h),
              child: Image(
                image: const AssetImage('assets/images/startingmukgen.png'),
                width: 160.0.w,
                height: 189.0.w,
              ),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              color: MukGenColor.white,
              height: 158.0.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.0.h,
                  ),
                  MukGenButton(
                    width: 353,
                    height: 55,
                    backgroundColor: MukGenColor.primaryLight3,
                    text: "로그인",
                    fontSize: 16,
                    textColor: MukGenColor.black,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ),
                  ),
                  SizedBox(
                    height: 24.0.h,
                  ),
                  MukGenButton(
                    width: 353,
                    height: 55,
                    backgroundColor: MukGenColor.pointLight1,
                    text: "시작하기",
                    fontSize: 16,
                    textColor: MukGenColor.white,
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => SignupStartPage())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
