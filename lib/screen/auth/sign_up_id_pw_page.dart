import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_number_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/widget/text_field_validation.dart';

class SignUpIdPwPage extends StatefulWidget {
  const SignUpIdPwPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<SignUpIdPwPage> createState() => _SignUpIdPwPageState();
}

class _SignUpIdPwPageState extends State<SignUpIdPwPage> {
  late TextEditingController idController;
  late TextEditingController pwdController;
  late TextEditingController pwdCheckController;

  bool _isButtonEnabled = false;
  bool _validState = false;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    idController.addListener(_updateState);
    pwdController = TextEditingController();
    pwdController.addListener(_updateState);
    pwdCheckController = TextEditingController();
    pwdCheckController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {
      _isButtonEnabled = idController.text.isNotEmpty && pwdController.text.isNotEmpty && pwdCheckController.text.isNotEmpty;
    });
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
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: MukGenColor.primaryLight1,
              size: 24.0.sp,
            ),
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
          MukGenTextField(
            width: 352,
            controller: idController,
            fontSize: 20,
            isPwdTextField: false,
            autofocus: true,
            maxLength: 15,
            hintText: "아이디",
            color: Validation.getFieldColor(idController.text, 5, 15),
            helperText: Validation.getValidation(idController.text, "최소 5자, 최대 15자", 5, 15, "아이디"),
          ),
          SizedBox(height: 24.0.h),
          MukGenTextField(
            width: 352,
            controller: pwdController,
            fontSize: 20,
            isPwdTextField: true,
            autofocus: false,
            maxLength: 20,
            hintText: "비밀번호",
            color: Validation.getPwdFieldColor(pwdController.text),
            helperText: Validation.getPwdValidation(pwdController.text),
          ),
          SizedBox(height: 24.0.h),
          MukGenTextField(
            width: 352,
            controller: pwdCheckController,
            fontSize: 20,
            isPwdTextField: true,
            autofocus: false,
            maxLength: 20,
            hintText: "비밀번호 확인",
            color: Validation.getPwdFieldColor(pwdCheckController.text, confirmPassword: pwdController.text),
            helperText: Validation.getPwdValidation(pwdCheckController.text, confirmPassword: pwdController.text),
          ),
          const Spacer(),
          MukGenButton(
            width: 352,
            height: 55,
            text: "다음",
            backgroundColor:
                _isButtonEnabled ? MukGenColor.grey : MukGenColor.primaryLight2,
            textColor: MukGenColor.white,
            fontSize: 16,
            onPressed: () {
              _isButtonEnabled
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpNumberPage(name: widget.name, id: idController.text, pwd: pwdController.text, pwdcheck: pwdCheckController.text)))
                  : null;
            },
          ),
        ],
      ),
    );
  }
}
