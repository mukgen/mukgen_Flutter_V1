import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_number_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
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

  late TextEditingController idController;
  late TextEditingController pwdController;
  late TextEditingController pwdCheckController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
    pwdCheckController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();
    pwdCheckController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0.w),
          onPressed: () => Navigator.of(context).pop(),
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
              controller: idController,
              onChanged: (value) => setState(() {}),
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
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                helperText: '최소 5자, 최대 15자',
                helperStyle: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MukgenRegular',
                    color: MukGenColor.primaryLight2),
                enabledBorder: idController.text.isEmpty
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
              controller: pwdController,
              onChanged: (value) => setState(() {}),
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
              controller: pwdCheckController,
              onChanged: (value) => setState(() {}),
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
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                  color: MukGenColor.primaryLight2,
                ),
                enabledBorder: pwdCheckController.text.isEmpty
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
          MukGenButton(
            width: 352,
            height: 55,
            text: "다음",
            textColor: MukGenColor.white,
            fontSize: 16,
            backgroundColor: idController.text.isNotEmpty &&
                    pwdController.text.isNotEmpty &&
                    pwdCheckController.text.isNotEmpty
                ? MukGenColor.primaryBase
                : MukGenColor.primaryLight2,
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignUpNumberPage())),
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
