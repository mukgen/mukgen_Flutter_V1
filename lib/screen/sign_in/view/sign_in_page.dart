import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_in_request_dto.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/provider/sign_in_view_model_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/provider/state/sign_in_state.dart';
import 'package:mukgen_flutter_v1/screen/widget/main_navigator.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();

    idController.addListener(_updateButtonState);
    pwdController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    ref.read(buttonStateProvider.notifier).state =
        idController.text.isNotEmpty && pwdController.text.isNotEmpty;
  }

  @override
  void dispose() {
    idController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signInViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case SignInState.success:
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainNavigator()),
              (route) => false);
        case SignInState.failure:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('아이디나 비밀번호가 일치하지 않습니다.')));
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
            onTap: () => Navigator.pop(context),
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
                  ref.watch(buttonStateProvider)
                      ? ref.read(signInViewModelProvider.notifier).signIn(
                              signInRequestDTO: SignInRequestDTO(
                            accountId: idController.text,
                            password: pwdController.text,
                          ))
                      : null;
                },
                backgroundColor: ref.watch(buttonStateProvider) ? MukGenColor.primaryBase : MukGenColor.primaryLight2,
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
