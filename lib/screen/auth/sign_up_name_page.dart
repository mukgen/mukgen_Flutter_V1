import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/auth/sign_up_id_pw_page.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
import 'package:mukgen_flutter_v1/widget/text_field_validation.dart';

class SignupNamePage extends StatefulWidget {
  const SignupNamePage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<SignupNamePage> createState() => _SignupNamePageState();
}

class _SignupNamePageState extends State<SignupNamePage> {
  late TextEditingController nameController;

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    nameController.addListener(_updateState);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void _updateState() {
    setState(() {
      _isButtonEnabled = nameController.text.isNotEmpty;
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
              '별명을 입력해주세요.',
              style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'MukgenSemiBold'),
            ),
          ),
          SizedBox(height: 24.0.h),
          MukGenTextField(
            width: 352,
            controller: nameController,
            fontSize: 20,
            isPwdTextField: false,
            autofocus: true,
            maxLength: 8,
            hintText: "별명",
            color: Validation.getFieldColor(nameController.text, 1, 8),
            helperText: Validation.getValidation(nameController.text, "최대 8자", 1, 8, "별명"),
          ),
          const Spacer(),
          MukGenButton(
            text: "다음",
            width: 352,
            height: 55,
            backgroundColor:
                _isButtonEnabled ? MukGenColor.grey : MukGenColor.primaryLight2,
            fontSize: 16,
            textColor: MukGenColor.white,
            onPressed: () {
              if (_isButtonEnabled) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignupIdPwPage(email: widget.email, name: nameController.text)
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
