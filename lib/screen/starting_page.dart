import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/signup_main.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/screen/login_page.dart';

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
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 199.0.h),
                  child: Image(
                    image: const AssetImage('assets/images/startingmukgen.png'),
                    width: 160.0.w,
                    height: 189.0.w,
                  ),
                ),
              ),
            ),
            SizedBox(height: 199.0.h),
            Container(
              alignment: Alignment.bottomCenter,
              color: MukGenColor.white,
              height: 158.0.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.0.h,
                  ),
                  SizedBox(
                    width: 353.0.w,
                    height: 55.0.h,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            Transition(
                              child: LoginPage(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                            ),
                          );
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MukGenColor.primaryLight3),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        '로그인',
                        style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'MukgenSemiBold',
                            color: MukGenColor.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0.h,
                  ),
                  SizedBox(
                    width: 353.0.w,
                    height: 55.0.h,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            Transition(
                              child: SignupStartPage(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                            ),
                          );
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            MukGenColor.primaryLight1),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Text(
                        '시작하기',
                        style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'MukgenSemiBold',
                            color: MukGenColor.white),
                      ),
                    ),
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
