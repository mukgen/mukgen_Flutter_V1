import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_event.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_confirm_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
import 'package:mukgen_flutter_v1/widget/text_field_validation.dart';

class SignupEmailInputPage extends StatefulWidget {
  const SignupEmailInputPage({Key? key}) : super(key: key);

  @override
  State<SignupEmailInputPage> createState() => _SignupEmailInputPageState();
}

class _SignupEmailInputPageState extends State<SignupEmailInputPage> {
  late TextEditingController emailController;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {
      context.read<SignUpBloc>().add(ResetEvent());
      _isButtonEnabled =
          emailController.text.isNotEmpty && Validation.emailValidation;
    });
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
              '이메일 인증을 진행해주세요.',
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
          ),
          SizedBox(height: 12.0.h),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '입력한 이메일로 인증번호가 전송됩니다.',
              style: TextStyle(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'MukgenRegular',
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  MukGenTextField(
                    width: 352,
                    controller: emailController,
                    fontSize: 20,
                    isPwdTextField: false,
                    autofocus: true,
                    maxLength: 256,
                    hintText: "이메일 주소",
                    color: Validation.getEmailFieldColor(emailController.text),
                    helperText:
                        Validation.getEmailValidation(emailController.text),
                  ),
                  Container(
                    width: 112.0.w,
                    height: 39.0.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: MukGenColor.primaryLight2,
                        )),
                    child: Center(
                      child: Text(
                        '@dsm.hs.kr',
                        style: TextStyle(
                          color: MukGenColor.primaryLight1,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          fontFamily: 'MukgenSemiBold',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is Loaded) {
                Future.microtask(
                  () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignupEmailConfirmPage(email: "${emailController.text}@dsm.hs.kr"),
                  )).then((_) => context.read<SignUpBloc>().add(ResetEvent())), // 다른 화면으로 이동 -> 상태 초기화
                );
              }
            },
            builder: (context, state) {
              return MukGenButton(
                text: "다음",
                width: 352,
                height: 55,
                backgroundColor: _isButtonEnabled
                    ? MukGenColor.grey
                    : MukGenColor.primaryLight2,
                fontSize: 16,
                textColor: MukGenColor.white,
                onPressed: () {
                  if (_isButtonEnabled) {
                    context.read<SignUpBloc>().add(LoadEmailInput(mail: "${emailController.text}@dsm.hs.kr"));
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
