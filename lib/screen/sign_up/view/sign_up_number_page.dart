  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_event.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_state.dart';
import 'package:mukgen_flutter_v1/screen/starting_page.dart';
import 'package:mukgen_flutter_v1/service/auth_service.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';

class SignupNumberPage extends StatefulWidget {
  const SignupNumberPage(
      {Key? key,
      required this.email,
      required this.name,
      required this.id,
      required this.pwd,
      required this.pwdcheck})
      : super(key: key);
  final String email, name, id, pwd, pwdcheck;

  @override
  State<SignupNumberPage> createState() => _SignupNumberPageState();
}

class _SignupNumberPageState extends State<SignupNumberPage> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;

  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _firstController = TextEditingController();
    _firstController.addListener(_updateButtonState);
    _secondController = TextEditingController();
    _secondController.addListener(_updateButtonState);
    _thirdController = TextEditingController();
    _thirdController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    super.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _firstController.text.length == 3 &&
          _secondController.text.length == 4 &&
          _thirdController.text.length == 4;
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
              '전화번호를 입력해주세요.',
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
              '배달 파티 모집 시 사용됩니다.',
              style: TextStyle(
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'MukgenRegular'),
            ),
          ),
          SizedBox(height: 24.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
              MukGenTextField(
                width: 98,
                height: 56,
                autofocus: true,
                controller: _firstController,
                fontSize: 20,
                textInputType: TextInputType.number,
                textAlign: TextAlign.center,
                isPwdTextField: false,
                focusNode: _firstFocusNode,
                nextFocusNode: _secondFocusNode,
                maxLength: 3,
              ),
              SizedBox(width: 10.0.w),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
              SizedBox(width: 10.0.w),
              MukGenTextField(
                width: 98,
                height: 56,
                controller: _secondController,
                autofocus: false,
                fontSize: 20,
                textInputType: TextInputType.number,
                textAlign: TextAlign.center,
                isPwdTextField: false,
                focusNode: _secondFocusNode,
                nextFocusNode: _thirdFocusNode,
                maxLength: 4,
              ),
              SizedBox(width: 10.0.w),
              Text(
                '-',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold',
                ),
              ),
              SizedBox(width: 10.0.w),
              MukGenTextField(
                width: 98,
                height: 56,
                controller: _thirdController,
                fontSize: 20,
                textAlign: TextAlign.center,
                textInputType: TextInputType.number,
                isPwdTextField: false,
                autofocus: false,
                focusNode: _thirdFocusNode,
                maxLength: 4,
              ),
            ],
          ),
          const Spacer(),
          BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is Loaded) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const StartingPage()),
                        (route) => false);
              }
            },
            builder: (context, state) {
              return MukGenButton(
                text: "완료",
                width: 352,
                height: 55,
                backgroundColor: _isButtonEnabled
                    ? MukGenColor.pointLight1
                    : MukGenColor.primaryLight2,
                fontSize: 16,
                textColor: MukGenColor.white,
                onPressed: () {
                  if (_isButtonEnabled) {
                    String phone = "";
                    phone += _firstController.text +
                        _secondController.text +
                        _thirdController.text;
                    context.read<SignUpBloc>().add(LoadSignUp(nickname: widget.name, accountId: widget.id, password: widget.pwd, passwordCheck: widget.pwdcheck, phoneNumber: phone, mail: widget.email));
                  }
                },
              );
            }
          ),
        ]
      ),
    );
  }
}
