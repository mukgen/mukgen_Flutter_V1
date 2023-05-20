import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/widget/main_navigator.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int index = 0;

  bool _changeiconColor = false;
  bool _obscureText = true;

  late TextEditingController idController;
  late TextEditingController pwdController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();
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
            SizedBox(
              width: 352.0.w,
              child: TextFormField(
                controller: idController,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0.sp,
                  fontFamily: 'MukgenSemiBold',
                ),
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: '아이디',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold',
                      color: MukGenColor.primaryLight2),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: idController.text.isEmpty
                              ? MukGenColor.primaryLight2
                              : MukGenColor.black,
                          width: 2)),
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
                controller: pwdController,
                onChanged: (value) => setState(() {}),
                obscureText: _obscureText,
                obscuringCharacter: '*',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  hintStyle: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'MukgenSemiBold',
                      color: MukGenColor.primaryLight2),
                  enabledBorder: pwdController.text.isEmpty
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
                    color: _changeiconColor
                        ? MukGenColor.pointLight1
                        : MukGenColor.primaryLight1,
                    icon: const Icon(Icons.remove_red_eye_rounded),
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
            MukGenButton(
              text: "로그인",
              width: 352,
              height: 55,
              backgroundColor:
                  idController.text.isNotEmpty && pwdController.text.isNotEmpty
                      ? MukGenColor.primaryBase
                      : MukGenColor.primaryLight2,
              fontSize: 16.0.sp,
              textColor: MukGenColor.white,
              onPressed: () => {
                setState(
                  () {
                    showDialog(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                if (idController.text.isNotEmpty &&
                                    pwdController.text.isNotEmpty) {
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
                    );
                  },
                ),
                SizedBox(height: 20.0.h),
              },
            ),
          ],
        ),
      ),
    );
  }
}
