import 'package:flutter/material.dart';

class SignUpIdPwPage extends StatefulWidget {
  final String email;
  final String name;
  const SignUpIdPwPage({Key? key, required this.email, required this.name}) : super(key: key);

  @override
  State<SignUpIdPwPage> createState() => _SignUpIdPwPageState();
}

class _SignUpIdPwPageState extends State<SignUpIdPwPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mukgen_flutter_v1/common/mukgen_color.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_bloc.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_event.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_state.dart';
// import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_number_page.dart';
// import 'package:mukgen_flutter_v1/service/auth_service.dart';
// import 'package:mukgen_flutter_v1/widget/mukgen_button.dart';
// import 'package:mukgen_flutter_v1/widget/mukgen_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mukgen_flutter_v1/widget/text_field_duplicate.dart';
// import 'package:mukgen_flutter_v1/widget/text_field_validation.dart';
//
// class SignupIdPwPage extends StatefulWidget {
//   const SignupIdPwPage({Key? key, required this.email, required this.name})
//       : super(key: key);
//
//   final String email;
//   final String name;
//
//   @override
//   State<SignupIdPwPage> createState() => _SignupIdPwPageState();
// }
//
// class _SignupIdPwPageState extends State<SignupIdPwPage> {
//   late TextEditingController idController;
//   late TextEditingController pwdController;
//   late TextEditingController pwdCheckController;
//
//   bool _isButtonEnabled = false;
//
//   String idValid = '최소 5자, 최대 15자';
//
//   Color? idColor = MukGenColor.primaryLight2;
//
//   @override
//   void initState() {
//     super.initState();
//     idController = TextEditingController();
//     idController.addListener(_updateState);
//     pwdController = TextEditingController();
//     pwdController.addListener(_updateState);
//     pwdCheckController = TextEditingController();
//     pwdCheckController.addListener(_updateState);
//   }
//
//   String _previousIdValue = "";
//
//   void _updateState() {
//     final currentIdValue = idController.text;
//
//     if (currentIdValue != _previousIdValue) {
//       setState(() {
//         DuplicateResult.isDuplicate = false;
//         idValid = Validation.getIdValidation(currentIdValue);
//         idColor = Validation.getIdFieldColor(currentIdValue);
//         context.read<SignUpBloc>().add(ResetEvent());
//       });
//
//       _previousIdValue = currentIdValue;
//     }
//     setState(() {
//       _isButtonEnabled = idValid.contains("사용 가능한") &&
//           Validation.getPwdValidation(pwdController.text).contains("사용 가능한") &&
//           Validation.getPwdValidation(pwdCheckController.text,
//                   confirmPassword: pwdController.text)
//               .contains("일치합니다");
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     idController.dispose();
//     pwdController.dispose();
//     pwdCheckController.dispose();
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
//               '아이디와\n비밀번호를 입력해주세요.',
//               style: TextStyle(
//                 fontSize: 24.0.sp,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'MukgenSemiBold',
//               ),
//             ),
//           ),
//           SizedBox(height: 24.0.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               BlocConsumer<SignUpBloc, SignUpState>(
//                 listener: (context, state) {
//                   if (state is Loaded) {
//                     idValid = '사용 가능한 아이디입니다.';
//                     idColor = MukGenColor.green;
//                   }
//                 },
//                 builder: (context, state) {
//                   return Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       SizedBox(
//                         width: 352.0.w,
//                         child: TextFormField(
//                           controller: idController,
//                           cursorColor: MukGenColor.black,
//                           style: TextStyle(
//                             color: MukGenColor.black,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'MukgenSemiBold',
//                           ),
//                           decoration: InputDecoration(
//                             helperText: idValid,
//                             helperStyle: TextStyle(
//                               color: idColor,
//                               fontSize: 16.sp,
//                               fontFamily: 'MukgenRegular',
//                               fontWeight: FontWeight.w400,
//                             ),
//                             hintText: "아이디",
//                             hintStyle: TextStyle(
//                               color: MukGenColor.primaryLight2,
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'MukgenSemiBold',
//                             ),
//                             enabledBorder: idController.text.isEmpty
//                                 ? UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: MukGenColor.primaryLight2,
//                                       width: 2,
//                                     ),
//                                   )
//                                 : UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: MukGenColor.black,
//                                       width: 2,
//                                     ),
//                                   ),
//                             focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: MukGenColor.pointBase,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           context.read<SignUpBloc>().add(LoadIdDuplicate(id: idController.text));
//                         },
//                         child: Container(
//                           width: 84.0.w,
//                           height: 37.0.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(6.r),
//                             border: Border.all(
//                               color: MukGenColor.primaryLight2,
//                             ),
//                           ),
//                           child: Center(
//                             child: Text(
//                               '중복 확인',
//                               style: TextStyle(
//                                 color: MukGenColor.primaryDark2,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 14.sp,
//                                 fontFamily: 'MukgenSemiBold',
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 24.0.h),
//           MukGenTextField(
//             width: 352,
//             controller: pwdController,
//             fontSize: 20,
//             isPwdTextField: true,
//             autofocus: false,
//             maxLength: 20,
//             hintText: "비밀번호",
//             color: Validation.getPwdFieldColor(pwdController.text),
//             helperText: Validation.getPwdValidation(pwdController.text),
//           ),
//           SizedBox(height: 24.0.h),
//           MukGenTextField(
//             width: 352,
//             controller: pwdCheckController,
//             fontSize: 20,
//             isPwdTextField: true,
//             autofocus: false,
//             maxLength: 20,
//             hintText: "비밀번호 확인",
//             color: Validation.getPwdFieldColor(pwdCheckController.text,
//                 confirmPassword: pwdController.text),
//             helperText: Validation.getPwdValidation(pwdCheckController.text,
//                 confirmPassword: pwdController.text),
//           ),
//           const Spacer(),
//           MukGenButton(
//             width: 352,
//             height: 55,
//             text: "다음",
//             backgroundColor:
//                 _isButtonEnabled ? MukGenColor.grey : MukGenColor.primaryLight2,
//             textColor: MukGenColor.white,
//             fontSize: 16,
//             onPressed: () {
//               _isButtonEnabled
//                   ? Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => SignupNumberPage(
//                           email: widget.email,
//                           name: widget.name,
//                           id: idController.text,
//                           pwd: pwdController.text,
//                           pwdcheck: pwdCheckController.text)))
//                   : null;
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
