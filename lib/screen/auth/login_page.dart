import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/widget/main_navigator.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int index = 0;

  bool _isButtonEnabled = false;

  late TextEditingController idController;
  late TextEditingController pwdController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    idController.addListener(_updateButtonState);
    pwdController = TextEditingController();
    pwdController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          idController.text.isNotEmpty && pwdController.text.isNotEmpty;
    });
  }

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
            size: 24.0.sp,
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
            MukGenTextField(
              width: 352,
              controller: idController,
              fontSize: 20,
              hintText: "아이디",
              isPwdTextField: false,
              maxLength: null,
            ),
            SizedBox(height: 24.0.h),
            MukGenTextField(
              width: 352,
              controller: pwdController,
              fontSize: 20,
              hintText: "비밀번호",
              isPwdTextField: true,
              maxLength: null,
            ),
            const Expanded(
              child: SizedBox(), // 빈 컨테이너 또는 원하는 위젯을 추가하세요
            ),
            MukGenButton(
              text: "로그인",
              width: 352,
              height: 55,
              backgroundColor: _isButtonEnabled
                  ? MukGenColor.primaryBase
                  : MukGenColor.primaryLight2,
              fontSize: 16.0.sp,
              textColor: MukGenColor.white,
              onPressed: () {
                _isButtonEnabled
                    ? showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.16),
                            ),
                            content: SizedBox(
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
                                          padding: EdgeInsets.only(top: 10.0.h),
                                          child: Text(
                                            '(사용자 ID)님 환영합니다!',
                                            style: TextStyle(
                                              fontFamily: 'MukgenSemiBold',
                                              fontSize: 24.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              MukGenButton(
                                text: "확인",
                                width: 280,
                                height: 50,
                                backgroundColor: MukGenColor.primaryLight1,
                                fontSize: 14,
                                textColor: MukGenColor.white,
                                onPressed: () {
                                  if (_isButtonEnabled) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainNavigator()),
                                        (route) => false);
                                  }
                                },
                              ),
                              SizedBox(height: 3.0.h)
                            ],
                          );
                        },
                      )
                    : null;
                SizedBox(height: 20.0.h);
              },
            ),
          ],
        ),
      ),
    );
  }
}
