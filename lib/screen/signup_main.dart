import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/screen/signup_nickname.dart';
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
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
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
            color: Color(0xFF85858D),
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
                  fontSize: 24,
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
                fontSize: 16,
                fontFamily: 'MukgenRegular',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0, 120),
              child: Image(
                image: AssetImage('assets/images/signupmukgen.png'),
                width: 160.0.w,
                height: 160.0.h,
              ),
            ),
          ),
          Spacer(),
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
              child: Text(
                '시작하기',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'MukgenSemiBold',
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF6B6C71)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
