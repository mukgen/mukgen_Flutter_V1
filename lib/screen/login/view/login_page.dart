import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/login/provider/login_provider.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
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
              '로그인을 위한\n정보를 입력해주세요.',
              MukGenColor.black,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: MukGenTextField(
                width: 352,
                height: 56,
                controller: idController,
                hintText: '아이디',
                fontSize: 20,
                isPwdTextField: false,
                maxLength: null,
                autofocus: true,
              ),
            ),
          ),
          Center(
            child: MukGenTextField(
              width: 352,
              height: 56,
              controller: pwdController,
              hintText: '비밀번호',
              fontSize: 20,
              isPwdTextField: true,
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
                  
                },
                backgroundColor: MukGenColor.primaryLight2,
                width: 352,
                height: 55,
                text: PtdTextWidget.bodyLarge2(
                  '로그인',
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
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:mukgen_flutter_v1/presentation/widget/mukgen_button.dart';
// import 'package:mukgen_flutter_v1/presentation/widget/mukgen_text_field.dart';
// import 'package:mukgen_flutter_v1/presentation/widget/validate_login.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mukgen_flutter_v1/common/mukgen_color.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   int index = 0;
//
//   bool _isButtonEnabled = false;
//
//   late TextEditingController idController;
//   late TextEditingController pwdController;
//
//   final storage = const FlutterSecureStorage();
//   dynamic userInfo = '';
//
//   @override
//   void initState() {
//     super.initState();
//     idController = TextEditingController();
//     idController.addListener(_updateButtonState);
//     pwdController = TextEditingController();
//     pwdController.addListener(_updateButtonState);
//   }
//
//   @override
//   void dispose() {
//     idController.dispose();
//     pwdController.dispose();
//     super.dispose();
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       ValidateLogin.loginValue = '';
//       _isButtonEnabled =
//           idController.text.isNotEmpty && pwdController.text.isNotEmpty;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
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
//               '로그인을 위한\n정보를 입력해주세요.',
//               style: TextStyle(
//                 fontSize: 24.0.sp,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'MukgenSemiBold',
//               ),
//             ),
//           ),
//           Expanded(
//             child: BlocConsumer<SignInBloc, SignInState>(
//               listener: (context, state) {
//                 if (state is Error) {
//                   ValidateLogin.loginValue = '아이디나 비밀번호가 맞지 않습니다.';
//                 }
//                 if (state is Loaded) {
//                   ValidateLogin.loginValue = '';
//                   storage.write(
//                       key: 'accessToken',
//                       value: state.loginResponse.tokenResponse!.accessToken);
//                   storage.write(
//                       key: 'refreshToken',
//                       value: state.loginResponse.tokenResponse!.refreshToken);
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     showDialog(
//                       context: context,
//                       barrierDismissible: true,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(9.16),
//                           ),
//                           content: SizedBox(
//                             width: 280.0.w,
//                             height: 45.0.h,
//                             child: SingleChildScrollView(
//                               child: ListBody(
//                                 children: <Widget>[
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.only(top: 10.0.h),
//                                         child: Text(
//                                           state.loginResponse.message
//                                               .toString(),
//                                           style: TextStyle(
//                                             fontFamily: 'MukgenSemiBold',
//                                             fontSize: 24.0.sp,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           actions: <Widget>[
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(bottom: 10.0.h, left: 4.0.w),
//                               child: MukGenButton(
//                                 text: "확인",
//                                 width: 285,
//                                 height: 50,
//                                 backgroundColor: MukGenColor.pointLight1,
//                                 fontSize: 14,
//                                 textColor: MukGenColor.white,
//                                 onPressed: () {
//                                   if (_isButtonEnabled) {
//                                     Future.microtask(
//                                       () => Navigator.of(context)
//                                           .push(MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const MainNavigator(),
//                                           ))
//                                           .then((_) => context
//                                               .read<SignInBloc>()
//                                               .add(
//                                                   ResetEvent())), // 다른 화면으로 이동 -> 상태 초기화
//                                     );
//                                   }
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 3.0.h)
//                           ],
//                         );
//                       },
//                     );
//                   });
//                 }
//               },
//               builder: (context, state) {
//                 return Column(
//                   children: [
//                     SizedBox(height: 24.0.h),
//                     MukGenTextField(
//                       width: 352,
//                       controller: idController,
//                       fontSize: 20,
//                       hintText: "아이디",
//                       isPwdTextField: false,
//                       autofocus: true,
//                       maxLength: null,
//                     ),
//                     SizedBox(height: 24.0.h),
//                     MukGenTextField(
//                       width: 352,
//                       controller: pwdController,
//                       fontSize: 20,
//                       hintText: "비밀번호",
//                       isPwdTextField: true,
//                       autofocus: false,
//                       maxLength: null,
//                       helperText: ValidateLogin.loginValue,
//                       color: MukGenColor.red,
//                     ),
//                     const Spacer(),
//                     MukGenButton(
//                       text: "로그인",
//                       width: 352,
//                       height: 55,
//                       backgroundColor: _isButtonEnabled
//                           ? MukGenColor.primaryBase
//                           : MukGenColor.primaryLight2,
//                       fontSize: 16.0.sp,
//                       textColor: MukGenColor.white,
//                       onPressed: _isButtonEnabled
//                           ? () {
//                               context.read<SignInBloc>().add(LoadSignIn(
//                                   accountId: idController.text,
//                                   password: pwdController.text));
//                             }
//                           : null,
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
