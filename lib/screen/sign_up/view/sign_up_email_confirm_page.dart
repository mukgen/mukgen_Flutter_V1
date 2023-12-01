import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/check_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/check_mail/check_mail_view_model_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/check_mail/state/check_mail_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/resend_mail/resend_mail_view_model_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_name_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/text_field_email_confirm.dart';

class SignUpEmailConfirmPage extends ConsumerStatefulWidget {
  const SignUpEmailConfirmPage({Key? key, required this.email})
      : super(key: key);

  final String email;

  @override
  ConsumerState<SignUpEmailConfirmPage> createState() =>
      _SignUpEmailConfirmPageState();
}

class _SignUpEmailConfirmPageState
    extends ConsumerState<SignUpEmailConfirmPage> {
  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;
  late TextEditingController _fourthController;
  late TextEditingController _fifthController;
  late TextEditingController _sixthController;

  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  final FocusNode _fifthFocusNode = FocusNode();
  final FocusNode _sixthFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _firstController = TextEditingController();
    _firstController.addListener(_updateButtonState);
    _secondController = TextEditingController();
    _secondController.addListener(_updateButtonState);
    _thirdController = TextEditingController();
    _thirdController.addListener(_updateButtonState);
    _fourthController = TextEditingController();
    _fourthController.addListener(_updateButtonState);
    _fifthController = TextEditingController();
    _fifthController.addListener(_updateButtonState);
    _sixthController = TextEditingController();
    _sixthController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _fifthController.dispose();
    _sixthController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    ref
        .read(checkMailButtonStateProvider.notifier)
        .state =
        _firstController.text.isNotEmpty &&
            _secondController.text.isNotEmpty &&
            _firstController.text.isNotEmpty &&
            _fourthController.text.isNotEmpty &&
            _fifthController.text.isNotEmpty &&
            _sixthController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkMailViewModelProvider.select((value) => value),
            (previous, next) {
          switch (next) {
            case CheckMailState.success:
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) => SignUpNamePage(email: widget.email,),), (
                  route) => false);
            case CheckMailState.failure :
              ScaffoldMessenger.of(context)
                  .showSnackBar(
                  const SnackBar(content: Text('인증번호가 일치하지 않습니다.')));
            default:
              null;
          }
        });
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(59.h),
        child: AppBar(
          backgroundColor: MukGenColor.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: MukGenColor.primaryLight1,
              size: 24.sp,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0.h),
            Text(
              '인증번호를 입력해주세요.',
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'MukgenSemiBold',
              ),
            ),
            SizedBox(height: 12.0.h),
            RichText(
              text: TextSpan(
                text: widget.email,
                style: TextStyle(
                  color: MukGenColor.pointBase,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " 로 메일이 전송되었습니다.",
                    style: TextStyle(
                      color: MukGenColor.primaryDark1,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 34.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailConfirmTextField(
                  focusNode: _firstFocusNode,
                  controller: _firstController,
                  nextFocusNode: _secondFocusNode,
                  autofocus: true,
                ),
                SizedBox(width: 9.0.w),
                EmailConfirmTextField(
                  focusNode: _secondFocusNode,
                  controller: _secondController,
                  nextFocusNode: _thirdFocusNode,
                ),
                SizedBox(width: 9.0.w),
                EmailConfirmTextField(
                  focusNode: _thirdFocusNode,
                  controller: _thirdController,
                  nextFocusNode: _fourthFocusNode,
                ),
                SizedBox(width: 9.0.w),
                EmailConfirmTextField(
                  focusNode: _fourthFocusNode,
                  controller: _fourthController,
                  nextFocusNode: _fifthFocusNode,
                ),
                SizedBox(width: 9.0.w),
                EmailConfirmTextField(
                  focusNode: _fifthFocusNode,
                  controller: _fifthController,
                  nextFocusNode: _sixthFocusNode,
                ),
                SizedBox(width: 9.0.w),
                EmailConfirmTextField(
                  focusNode: _sixthFocusNode,
                  controller: _sixthController,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                PtdTextWidget.bodyLarge(
                  "이메일을 받지 못하셨나요?",
                  MukGenColor.primaryDark1,
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    ref.read(resendMailViewModelProvider.notifier)
                        .resendMailAuthCode(
                      sendMailAuthCodeRequestDTO:
                      SendMailAuthCodeRequestDTO(
                        mail: widget.email,
                      ),
                    );
                  },
                  child: PtdTextWidget.bodyLarge2(
                    "재전송하기",
                    MukGenColor.pointBase,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            MukGenButton(
              onPressed: () {
                String code = _firstController.text +
                    _secondController.text +
                    _thirdController.text +
                    _fourthController.text +
                    _fifthController.text +
                    _sixthController.text;
                ref.watch(checkMailButtonStateProvider)
                    ? ref
                    .read(checkMailViewModelProvider.notifier)
                    .checkMailAuthCode(
                    checkMailAuthCodeRequestDTO:
                    CheckMailAuthCodeRequestDTO(
                        mail: widget.email, code: code))
                    : null;
              },
              backgroundColor: ref.watch(checkMailButtonStateProvider)
                  ? MukGenColor.primaryBase
                  : MukGenColor.primaryLight2,
              width: 352,
              height: 55,
              text: PtdTextWidget.bodyLarge2(
                '확인',
                MukGenColor.white,
              ),
            ),
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }
}
