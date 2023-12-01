import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/data/dto/mail/request/send_mail_auth_code_request_dto.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/send_mail/send_mail_view_model_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/send_mail/state/send_mail_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_confirm_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class SignUpEmailInputPage extends ConsumerStatefulWidget {
  const SignUpEmailInputPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpEmailInputPage> createState() =>
      _SignUpEmailInputPageState();
}

class _SignUpEmailInputPageState extends ConsumerState<SignUpEmailInputPage> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _emailController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    ref.read(sendMailButtonStateProvider.notifier).state =
        _emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sendMailViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case SendMailState.loading:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpEmailConfirmPage(email: '${_emailController.text}@dsm.hs.kr',)));
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
            SizedBox(height: 40.h),
            PtdTextWidget.title(
              '이메일 인증을 진행해주세요.',
              MukGenColor.black,
            ),
            SizedBox(height: 12.h),
            PtdTextWidget.bodyLarge(
              '입력한 이메일로 인증번호가 전송됩니다.',
              MukGenColor.black,
            ),
            SizedBox(height: 24.h),
            MukGenTextField(
              width: 352,
              height: 56,
              controller: _emailController,
              hintText: '이메일 주소',
              suffix: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Text(
                  '@dsm.hs.kr',
                  style: TextStyle(
                    color: MukGenColor.primaryBase,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              fontSize: 20,
              isPwdTextField: false,
              maxLength: null,
              autofocus: true,
            ),
            const Spacer(),
            MukGenButton(
              onPressed: () {
                ref.read(sendMailViewModelProvider.notifier).sendMailAuthCode(
                    sendMailAuthCodeRequestDTO: SendMailAuthCodeRequestDTO(
                        mail: '${_emailController.text}@dsm.hs.kr'));
              },
              backgroundColor: ref.watch(sendMailButtonStateProvider)
                  ? MukGenColor.primaryBase
                  : MukGenColor.primaryLight2,
              width: 352,
              height: 55,
              text: PtdTextWidget.bodyLarge2(
                '다음',
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