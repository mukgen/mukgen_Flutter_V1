import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_nickname_page.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupStartPage extends StatefulWidget {
  const SignupStartPage({Key? key}) : super(key: key);

  @override
  State<SignupStartPage> createState() => _SignupStartPageState();
}

class _SignupStartPageState extends State<SignupStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0.w),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.arrow_back,
            color: MukGenColor.primaryLight1,
            size: 24,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.0.h),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '시작하기',
              style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '먹젠과 함께 학교에서 즐거운 식생활을 누려보세요.',
              style: TextStyle(
                fontSize: 16.0.sp,
                fontFamily: 'MukgenRegular',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: const Offset(0, 120),
              child: Image(
                image: const AssetImage('assets/images/signupmukgen.png'),
                width: 160.0.w,
                height: 160.0.h,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 352.0.w,
            height: 55.0.h,
            child: TextButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    Transition(
                      child: SignUpNamePage(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    ),
                  );
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MukGenColor.primaryBase),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                '시작하기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0.sp,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
