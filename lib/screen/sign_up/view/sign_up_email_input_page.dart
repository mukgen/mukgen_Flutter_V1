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
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();

    emailController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    ref.read(sendMailButtonStateProvider.notifier).state =
        emailController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sendMailViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case SendMailState.loading:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignUpEmailConfirmPage()));
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: PtdTextWidget.title(
              '이메일 인증을 진행해주세요.',
              MukGenColor.black,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: PtdTextWidget.bodyLarge(
              '입력한 이메일로 인증번호가 전송됩니다.',
              MukGenColor.black,
            ),
          ),
          SizedBox(height: 24.h),
          Center(
            child: MukGenTextField(
              width: 352,
              height: 56,
              controller: emailController,
              hintText: '이메일 주소',
              suffixText: Padding(
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
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 34.h),
            child: Center(
              child: MukGenButton(
                onPressed: () {
                  ref.read(sendMailViewModelProvider.notifier).sendMail(
                      sendMailAuthCodeRequestDTO: SendMailAuthCodeRequestDTO(
                          mail: '${emailController.text}@dsm.hs.kr'));
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
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mukgen_flutter_v1/common/mukgen_color.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_bloc.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_event.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_state.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_email_confirm_page.dart';
// import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
// import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
// import 'package:mukgen_flutter_v1/widget/text_field_validation.dart';
//
// class SignupEmailInputPage extends StatefulWidget {
//   const SignupEmailInputPage({Key? key}) : super(key: key);
//
//   @override
//   State<SignupEmailInputPage> createState() => _SignupEmailInputPageState();
// }
//
// class _SignupEmailInputPageState extends State<SignupEmailInputPage> {
//   late TextEditingController emailController;
//
//   bool _isButtonEnabled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     emailController.addListener(_updateState);
//   }
//
//   void _updateState() {
//     setState(() {
//       context.read<SignUpBloc>().add(ResetEvent());
//       _isButtonEnabled =
//           emailController.text.isNotEmpty && Validation.emailValidation;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MukGenColor.white,
//       appBar: AppBar(
//         backgroundColor: MukGenColor.white,
//         elevation: 0,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 20.0.w),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Icon(
//               Icons.arrow_back,
//               color: MukGenColor.primaryLight1,
//               size: 24.0.sp,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(height: 40.0.h),
//           Container(
//             alignment: Alignment.topLeft,
//             margin: EdgeInsets.only(left: 20.0.w),
//             child: Text(
//               '이메일 인증을 진행해주세요.',
//               style: TextStyle(
//                 fontSize: 24.0.sp,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'MukgenSemiBold',
//               ),
//             ),
//           ),
//           SizedBox(height: 12.0.h),
//           Container(
//             alignment: Alignment.topLeft,
//             margin: EdgeInsets.only(left: 20.0.w),
//             child: Text(
//               '입력한 이메일로 인증번호가 전송됩니다.',
//               style: TextStyle(
//                 fontSize: 16.0.sp,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: 'MukgenRegular',
//               ),
//             ),
//           ),
//           SizedBox(height: 24.0.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   MukGenTextField(
//                     width: 352,
//                     controller: emailController,
//                     fontSize: 20,
//                     isPwdTextField: false,
//                     autofocus: true,
//                     maxLength: 256,
//                     hintText: "이메일 주소",
//                     color: Validation.getEmailFieldColor(emailController.text),
//                     helperText:
//                         Validation.getEmailValidation(emailController.text),
//                   ),
//                   Container(
//                     width: 112.0.w,
//                     height: 39.0.h,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6.r),
//                         border: Border.all(
//                           color: MukGenColor.primaryLight2,
//                         )),
//                     child: Center(
//                       child: Text(
//                         '@dsm.hs.kr',
//                         style: TextStyle(
//                           color: MukGenColor.primaryLight1,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14.sp,
//                           fontFamily: 'MukgenSemiBold',
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//           const Spacer(),
//           BlocConsumer<SignUpBloc, SignUpState>(
//             listener: (context, state) {
//               if (state is Loaded) {
//                 Future.microtask(
//                   () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => SignupEmailConfirmPage(email: "${emailController.text}@dsm.hs.kr"),
//                   )).then((_) => context.read<SignUpBloc>().add(ResetEvent())), // 다른 화면으로 이동 -> 상태 초기화
//                 );
//               }
//             },
//             builder: (context, state) {
//               return MukGenButton(
//                 text: "다음",
//                 width: 352,
//                 height: 55,
//                 backgroundColor: _isButtonEnabled
//                     ? MukGenColor.grey
//                     : MukGenColor.primaryLight2,
//                 fontSize: 16,
//                 textColor: MukGenColor.white,
//                 onPressed: () {
//                   if (_isButtonEnabled) {
//                     context.read<SignUpBloc>().add(LoadEmailInput(mail: "${emailController.text}@dsm.hs.kr"));
//                   }
//                 },
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
