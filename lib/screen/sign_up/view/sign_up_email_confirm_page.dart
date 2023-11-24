import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class SignUpEmailConfirmPage extends StatefulWidget {
  const SignUpEmailConfirmPage({Key? key}) : super(key: key);

  @override
  State<SignUpEmailConfirmPage> createState() => _SignUpEmailConfirmPageState();
}

class _SignUpEmailConfirmPageState extends State<SignUpEmailConfirmPage> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
              fontSize: 20,
              isPwdTextField: false,
              maxLength: null,
              autofocus: true,
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mukgen_flutter_v1/common/mukgen_color.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_bloc.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_event.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_state.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_name_page.dart';
// import 'package:mukgen_flutter_v1/service/mail_service.dart';
// import 'package:mukgen_flutter_v1/presentation/widget/mukgen_button.dart';
// import 'package:mukgen_flutter_v1/presentation/widget/text_field_email_confirm.dart';
//
// class SignupEmailConfirmPage extends StatefulWidget {
//   const SignupEmailConfirmPage({Key? key, required this.email})
//       : super(key: key);
//
//   final String email;
//
//   @override
//   State<SignupEmailConfirmPage> createState() => _SignupEmailConfirmPageState();
// }
//
// class _SignupEmailConfirmPageState extends State<SignupEmailConfirmPage> {
//   late TextEditingController _firstController;
//   late TextEditingController _secondController;
//   late TextEditingController _thirdController;
//   late TextEditingController _fourthController;
//   late TextEditingController _fifthController;
//   late TextEditingController _sixthController;
//
//   final FocusNode _firstFocusNode = FocusNode();
//   final FocusNode _secondFocusNode = FocusNode();
//   final FocusNode _thirdFocusNode = FocusNode();
//   final FocusNode _fourthFocusNode = FocusNode();
//   final FocusNode _fifthFocusNode = FocusNode();
//   final FocusNode _sixthFocusNode = FocusNode();
//
//   bool _isButtonEnabled = false;
//
//   String _isConfirm = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _firstController = TextEditingController();
//     _firstController.addListener(_updateState);
//     _secondController = TextEditingController();
//     _secondController.addListener(_updateState);
//     _thirdController = TextEditingController();
//     _thirdController.addListener(_updateState);
//     _fourthController = TextEditingController();
//     _fourthController.addListener(_updateState);
//     _fifthController = TextEditingController();
//     _fifthController.addListener(_updateState);
//     _sixthController = TextEditingController();
//     _sixthController.addListener(_updateState);
//   }
//
//   @override
//   void dispose() {
//     _firstController.dispose();
//     _secondController.dispose();
//     _thirdController.dispose();
//     _fourthController.dispose();
//     _fifthController.dispose();
//     _sixthController.dispose();
//     super.dispose();
//   }
//
//   void _updateState() {
//     setState(() {
//       _isConfirm = '';
//       _isButtonEnabled = _firstController.text.isNotEmpty &&
//           _secondController.text.isNotEmpty &&
//           _thirdController.text.isNotEmpty &&
//           _fourthController.text.isNotEmpty &&
//           _fifthController.text.isNotEmpty &&
//           _sixthController.text.isNotEmpty;
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
//         children: [
//           SizedBox(height: 40.0.h),
//           Container(
//             alignment: Alignment.topLeft,
//             margin: EdgeInsets.only(left: 20.0.w),
//             child: Text(
//               '인증번호를 입력해주세요.',
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
//             child: RichText(
//               text: TextSpan(
//                 text: widget.email,
//                 style: TextStyle(
//                   color: MukGenColor.pointBase,
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: 'MukgenRegular',
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: " 로 메일이 전송되었습니다.\n메일이 오지 않으면 스팸함을 확인해주세요.",
//                     style: TextStyle(
//                       color: MukGenColor.primaryDark1,
//                       fontSize: 16.sp,
//                       fontFamily: 'MukgenRegular',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 34.0.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               EmailConfirmTextField(
//                 focusNode: _firstFocusNode,
//                 controller: _firstController,
//                 nextFocusNode: _secondFocusNode,
//                 autofocus: true,
//               ),
//               SizedBox(width: 9.0.w),
//               EmailConfirmTextField(
//                 focusNode: _secondFocusNode,
//                 controller: _secondController,
//                 nextFocusNode: _thirdFocusNode,
//               ),
//               SizedBox(width: 9.0.w),
//               EmailConfirmTextField(
//                 focusNode: _thirdFocusNode,
//                 controller: _thirdController,
//                 nextFocusNode: _fourthFocusNode,
//               ),
//               SizedBox(width: 9.0.w),
//               EmailConfirmTextField(
//                 focusNode: _fourthFocusNode,
//                 controller: _fourthController,
//                 nextFocusNode: _fifthFocusNode,
//               ),
//               SizedBox(width: 9.0.w),
//               EmailConfirmTextField(
//                 focusNode: _fifthFocusNode,
//                 controller: _fifthController,
//                 nextFocusNode: _sixthFocusNode,
//               ),
//               SizedBox(width: 9.0.w),
//               EmailConfirmTextField(
//                 focusNode: _sixthFocusNode,
//                 controller: _sixthController,
//               ),
//             ],
//           ),
//           SizedBox(height: 10.0.h),
//           Expanded(
//             child: BlocConsumer<SignUpBloc, SignUpState> (
//               listener: (context, state) {
//                 if (state is Error) {
//                   _isConfirm = '인증번호가 일치하지 않습니다.';
//                 }
//                 if (state is Loaded) {
//                   Future.microtask(
//                         () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
//                       builder: (context) => SignupNamePage(email: widget.email),
//                     ),(route) => false).then((_) => context.read<SignUpBloc>().add(ResetEvent())), // 다른 화면으로 이동 -> 상태 초기화
//                   );
//                 }
//               },
//               builder: (context, state) {
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           _isConfirm,
//                           style: TextStyle(
//                             color: MukGenColor.red,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'MukgenRegular',
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     Row(
//                       children: [
//                         SizedBox(width: 20.0.w),
//                         Text(
//                           '이메일을 받지 못하셨나요?',
//                           style: TextStyle(
//                             color: MukGenColor.primaryDark1,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'MukgenRegular',
//                           ),
//                         ),
//                         SizedBox(width: 10.0.w),
//                         GestureDetector(
//                           onTap: () {
//                             context.read<SignUpBloc>().add(ReloadEmailInput(mail: widget.email));
//                           },
//                           child: Text(
//                             '재전송하기',
//                             style: TextStyle(
//                               color: MukGenColor.pointBase,
//                               fontSize: 16.sp,
//                               fontFamily: 'MukgenSemiBold',
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10.0.h),
//                     MukGenButton(
//                         text: "확인",
//                         width: 352,
//                         height: 55,
//                         backgroundColor: _isButtonEnabled
//                             ? MukGenColor.pointLight1
//                             : MukGenColor.primaryLight2,
//                         fontSize: 16,
//                         textColor: MukGenColor.white,
//                         onPressed: () {
//                           String code = _firstController.text +
//                               _secondController.text +
//                               _thirdController.text +
//                               _fourthController.text +
//                               _fifthController.text +
//                               _sixthController.text;
//                           if (_isButtonEnabled) {
//                             context.read<SignUpBloc>().add(LoadEmailConfirm(code: code, mail: widget.email));
//                           }
//                         }
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
