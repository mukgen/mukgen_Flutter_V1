import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_number.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpIdPwPage extends StatefulWidget {
  const SignUpIdPwPage({Key? key}) : super(key: key);

  @override
  State<SignUpIdPwPage> createState() => _SignUpIdPwPageState();
}

class _SignUpIdPwPageState extends State<SignUpIdPwPage> {
  bool _changeIconColor = false;
  bool _changeIconColor2 = false;
  bool _obscureText = true;
  bool _obscureText2 = true;
  String _inputValue = '';
  String _inputValue2 = '';
  String _inputValue3 = '';

  bool get isFormValid =>
      _inputValue.isNotEmpty &&
      _inputValue2.isNotEmpty &&
      _inputValue3.isNotEmpty;

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
            size: 24.0.sp,
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
              '아이디와\n비밀번호를 입력해주세요.',
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
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
              maxLength: 15,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0.sp,
                fontFamily: 'MukgenSemiBold',
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: '아이디',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                helperText: '최소 5자, 최대 15자',
                helperStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MukgenRegular',
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
          SizedBox(height: 24.0.h),
          SizedBox(
            width: 352.0.w,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _inputValue2 = value;
                });
              },
              maxLength: 20,
              obscureText: _obscureText,
              obscuringCharacter: '*',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: '비밀번호',
                hintStyle: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                helperText: '특수문자 최소 1자 포함, 최대 20자',
                helperStyle: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MukgenRegular',
                    color: MukGenColor.primaryLight2),
                enabledBorder: _inputValue2.isEmpty
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: MukGenColor.primaryLight2, width: 2))
                    : UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.black, width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: MukGenColor.pointBase, width: 2)),
                suffixIcon: IconButton(
                  color: _changeIconColor
                      ? MukGenColor.pointLight1
                      : MukGenColor.primaryLight1,
                  icon: const Icon(Icons.remove_red_eye_rounded),
                  onPressed: () {
                    setState(() {
                      _changeIconColor = !_changeIconColor;
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          SizedBox(
            width: 352.0.w,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _inputValue3 = value;
                });
              },
              maxLength: 20,
              obscureText: _obscureText2,
              obscuringCharacter: '*',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: '비밀번호 확인',
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                enabledBorder: _inputValue3.isEmpty
                    ? UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: MukGenColor.primaryLight2, width: 2))
                    : UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MukGenColor.black, width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: MukGenColor.pointBase, width: 2)),
                suffixIcon: IconButton(
                  color: _changeIconColor2
                      ? MukGenColor.pointLight1
                      : MukGenColor.primaryLight1,
                  icon: const Icon(Icons.remove_red_eye_rounded),
                  onPressed: () {
                    setState(() {
                      _changeIconColor2 = !_changeIconColor2;
                      _obscureText2 = !_obscureText2;
                    });
                  },
                ),
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
                  if (isFormValid == true) {
                    Navigator.push(
                      context,
                      Transition(
                        child: SignUpNumberPage(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                      ),
                    );
                  }
                });
              },
              style: ButtonStyle(
                backgroundColor: isFormValid == false
                    ? MaterialStateProperty.all(MukGenColor.primaryLight2)
                    : MaterialStateProperty.all(MukGenColor.primaryBase),
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
