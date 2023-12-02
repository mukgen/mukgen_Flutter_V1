import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/data/dto/auth/request/sign_up_request_dto.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/controller_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/sign_up_view_model_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/state/sign_up_state.dart';
import 'package:mukgen_flutter_v1/screen/starting_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class SignUpNumberPage extends ConsumerStatefulWidget {
  final String email;
  final String id;
  final String password;
  final String passwordCheck;
  final String name;

  const SignUpNumberPage({
    Key? key,
    required this.email,
    required this.id,
    required this.password,
    required this.passwordCheck,
    required this.name,
  }) : super(key: key);

  @override
  ConsumerState<SignUpNumberPage> createState() => _SignUpNumberPageState();
}

class _SignUpNumberPageState extends ConsumerState<SignUpNumberPage> {
  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;

  @override
  void initState() {
    super.initState();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
    _firstController.addListener(_updateButtonState);
    _secondController.addListener(_updateButtonState);
    _thirdController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    ref.read(numberButtonProvider.notifier).state =
        _firstController.text.isNotEmpty &&
            _secondController.text.isNotEmpty &&
            _thirdController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signUpViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case SignUpState.success:
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const StartingPage()),
            (route) => false,
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('회원가입이 완료되었습니다.')));
        case SignUpState.failure:
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('회원가입에 실패했습니다.')));
        default :
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
              "전화번호를 입력해주세요.",
              MukGenColor.black,
            ),
            SizedBox(height: 12.h),
            PtdTextWidget.bodyLarge(
              "배달 파티 모집 시 사용됩니다.",
              MukGenColor.primaryDark1,
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                MukGenTextField(
                  width: 98,
                  height: 56,
                  autofocus: true,
                  controller: _firstController,
                  fontSize: 20,
                  textInputType: TextInputType.number,
                  textAlign: TextAlign.center,
                  isPwdTextField: false,
                  focusNode: _firstFocusNode,
                  nextFocusNode: _secondFocusNode,
                  maxLength: 3,
                ),
                SizedBox(width: 10.0.w),
                PtdTextWidget.subtitle(
                  '-',
                  MukGenColor.black,
                ),
                SizedBox(width: 10.0.w),
                MukGenTextField(
                  width: 98,
                  height: 56,
                  controller: _secondController,
                  autofocus: false,
                  fontSize: 20,
                  textInputType: TextInputType.number,
                  textAlign: TextAlign.center,
                  isPwdTextField: false,
                  focusNode: _secondFocusNode,
                  nextFocusNode: _thirdFocusNode,
                  maxLength: 4,
                ),
                SizedBox(width: 10.0.w),
                PtdTextWidget.subtitle(
                  '-',
                  MukGenColor.black,
                ),
                SizedBox(width: 10.0.w),
                MukGenTextField(
                  width: 98,
                  height: 56,
                  controller: _thirdController,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  textInputType: TextInputType.number,
                  isPwdTextField: false,
                  autofocus: false,
                  focusNode: _thirdFocusNode,
                  maxLength: 4,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 34.h),
              child: MukGenButton(
                onPressed: () {
                  String phoneNumber = _firstController.text +
                      _secondController.text +
                      _thirdController.text;
                  ref.watch(numberButtonProvider)
                      ? ref.read(signUpViewModelProvider.notifier).signUp(
                              signUpRequestDTO: SignUpRequestDTO(
                            accountId: widget.id,
                            password: widget.password,
                            mail: widget.email,
                            nickname: widget.name,
                            passwordCheck: widget.passwordCheck,
                            phoneNumber: phoneNumber,
                          ))
                      : null;
                },
                text: PtdTextWidget.bodyLarge2(
                  '완료',
                  MukGenColor.white,
                ),
                width: 352,
                height: 55,
                backgroundColor: ref.watch(numberButtonProvider)
                    ? MukGenColor.pointBase
                    : MukGenColor.primaryLight2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}