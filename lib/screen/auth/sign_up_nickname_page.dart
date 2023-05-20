import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_id_pw_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpNamePage extends StatefulWidget {
  const SignUpNamePage({Key? key}) : super(key: key);

  @override
  State<SignUpNamePage> createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignUpNamePage> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
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
              '이름을 입력해주세요.',
              style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 24.0.h),
          SizedBox(
            width: 352.0.w,
            child: TextFormField(
              controller: nameController,
              onChanged: (value) => setState(() {}),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0.sp,
              ),
              decoration: InputDecoration(
                hintText: '이름',
                hintStyle: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MukgenSemiBold',
                    color: MukGenColor.primaryLight2),
                enabledBorder: nameController.text.isEmpty
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
          const Spacer(),
          MukGenButton(
            text: "다음",
            width: 352,
            height: 55,
            backgroundColor: nameController.text.isEmpty
                ? MukGenColor.primaryLight2
                : MukGenColor.grey,
            fontSize: 16,
            textColor: MukGenColor.white,
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpIdPwPage()),
                );
              }
            },
          ),
          SizedBox(height: 20.0.h),
        ],
      ),
    );
  }
}
