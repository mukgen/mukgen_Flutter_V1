import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_input_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignupStartPage extends StatefulWidget {
  const SignupStartPage({Key? key}) : super(key: key);

  @override
  State<SignupStartPage> createState() => _SignupStartPageState();
}

class _SignupStartPageState extends State<SignupStartPage> {
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
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '시작하기',
              style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0.w),
            child: Text(
              '먹젠과 함께 학교에서 즐거운 식생활을 누려보세요.',
              style: TextStyle(
                fontSize: 16.0.sp,
                fontFamily: 'MukgenRegular',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: const Offset(0, 120),
              child: Image(
                image: const AssetImage('assets/images/SignUpMukgen.png'),
                width: 160.0.w,
                height: 160.0.h,
              ),
            ),
          ),
          const Spacer(),
          MukGenButton(
            width: 352,
            height: 55,
            backgroundColor: MukGenColor.primaryBase,
            text: "시작하기",
            textColor: MukGenColor.white,
            fontSize: 16,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignupEmailInputPage()),
            ),
          ),
        ],
      ),
    );
  }
}
