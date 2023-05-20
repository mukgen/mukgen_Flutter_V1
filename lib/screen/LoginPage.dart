import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/widget/Main_Navigator.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  int index = 0;

  bool _changeiconColor = false;
  bool _obscureText = true;
  String _inputValue = '';
  String _inputValue2 = '';

  bool get isFormValid => _inputValue.isNotEmpty && _inputValue2.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0.w),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: MukGenColor.primaryLight1,
            size: 24,
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40.0.h),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20.0.w),
              child: Text(
                '로그인을 위한\n정보를 입력해주세요.',
                style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
            ),
            SizedBox(height: 24.0.h),
            Container(
              width: 352.0.w,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _inputValue = value;
                  });
                },
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: 'MukgenSemiBold',
                ),
                decoration: InputDecoration(
                  hintText: '아이디',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold',
                      color: MukGenColor.white),
                  enabledBorder: _inputValue.isEmpty
                      ? UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MukGenColor.white, width: 2))
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
            Container(
              width: 352.0.w,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    _inputValue2 = value;
                  });
                },
                obscureText: _obscureText,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold',
                      color: MukGenColor.primaryLight2),
                  enabledBorder: _inputValue2.isEmpty
                      ? UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MukGenColor.primaryLight2, width: 2))
                      : UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MukGenColor.black, width: 2)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MukGenColor.pointBase, width: 2)),
                  suffixIcon: IconButton(
                    color: _changeiconColor
                        ? MukGenColor.pointLight1
                        : MukGenColor.primaryLight1,
                    icon: Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {
                      setState(() {
                        _changeiconColor = !_changeiconColor;
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(), // 빈 컨테이너 또는 원하는 위젯을 추가하세요
            ),
            SizedBox(
              width: 352.0.w,
              height: 55.0.h,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.16),
                            ),
                            content: Container(
                              width: 280.0.w,
                              height: 45.0.h,
                              child: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            '(사용자 ID)님 환영합니다!',
                                            style: TextStyle(
                                              fontFamily: 'MukgenSemiBold',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(top: 10.0.h),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  if (isFormValid == true) {
                                    setState(() {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                        context,
                                        Transition(
                                          child: MainNavigatorApp(),
                                          transitionEffect:
                                              TransitionEffect.RIGHT_TO_LEFT,
                                        ),
                                      );
                                    });
                                  }
                                },
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      '확인',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        fontFamily: 'MukgenSemiBold',
                                        color: Colors.white,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    width: 280.0.w,
                                    height: 50.0.h,
                                    decoration: BoxDecoration(
                                      color: MukGenColor.primaryLight1,
                                      borderRadius: BorderRadius.circular(7.12),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.0.h)
                            ],
                          );
                        });
                  });
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'MukgenSemiBold',
                    color: Colors.white,
                  ),
                ),
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
              ),
            ),
            SizedBox(height: 20.0.h),
          ],
        ),
      ),
    );
  }
}
