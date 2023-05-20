import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_id_pw_page.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpNamePage extends StatefulWidget {
  const SignUpNamePage({Key? key}) : super(key: key);

  @override
  State<SignUpNamePage> createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignUpNamePage> {
  String _inputValue = '';

  bool get isFormValid => _inputValue.isNotEmpty;

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
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '이름을 입력해주세요.',
              style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 24.0.h),
          SizedBox(
            width: 352.0.w,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _inputValue = value;
                });
              },
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0.sp,
              ),
              decoration: InputDecoration(
                hintText: '이름',
                hintStyle: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                    color: MukGenColor.primaryLight2),
                enabledBorder: _inputValue.isEmpty
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
          ),
          const Spacer(),
          SizedBox(
            width: 352.0.w,
            height: 55.0.h,
            child: TextButton(
              onPressed: () {
                setState(
                  () {
                    if (isFormValid == true) {
                      Navigator.push(
                        context,
                        Transition(
                          child: SignUpIdPwPage(),
                          transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        ),
                      );
                    }
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: isFormValid == false
                    ? MaterialStateProperty.all(MukGenColor.primaryLight2)
                    : MaterialStateProperty.all(MukGenColor.grey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                '다음',
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
