import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/screen/SignUp/sign_up_id_pw_page.dart';
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
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '별명을 입력해주세요.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
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
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: '별명',
                hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                    color: Color(0xFFC9CAD0)),
                enabledBorder: _inputValue.isEmpty
                    ? UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC9CAD0), width: 2))
                    : UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 2)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFE6B01), width: 2)),
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
                  if (isFormValid == true) {
                    Navigator.push(
                      context,
                      Transition(
                        child: SignUpIdPwPage(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                      ),
                    );
                  }
                });
              },
              child: Text(
                '다음',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'MukgenSemiBold',
                  color: Color(0xFFFFFFFF),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: isFormValid == false
                    ? MaterialStateProperty.all(Color(0xFFC9CAD0))
                    : MaterialStateProperty.all(Color(0xFF6B6C71)),
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
