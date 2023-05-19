import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/screen/Signup_main.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/screen/LoginPage.dart';

class StartingApp extends StatefulWidget {
  const StartingApp({Key? key}) : super(key: key);

  @override
  State<StartingApp> createState() => _StartingAppState();
}

class _StartingAppState extends State<StartingApp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F6),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 199.0.h),
                  child: Image(
                    image: AssetImage('assets/images/startingmukgen.png'),
                    width: 160.0.w,
                    height: 189.0.w,
                  ),
                ),
              ),
            ),
            SizedBox(height: 199.0.h),
            Container(
              alignment: Alignment.bottomCenter,
              color: Color(0xFFFFFFFF),
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
                              child: LoginApp(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                            ),
                          );
                        });
                      },
                      child: Text(
                        '로그인',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'MukgenSemiBold',
                            color: Color(0xFF000000)),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xFFF5F6F6)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
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
                              child: SignupStartApp(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                            ),
                          );
                        });
                      },
                      child: Text(
                        '시작하기',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'MukgenSemiBold',
                            color: Color(0xFFFFFFFF)),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFF7A1B)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
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
