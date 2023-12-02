import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/id_duplicate/id_duplicate_view_model_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/id_duplicate/state/id_duplicate_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_number_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class SignUpIdPwPage extends ConsumerStatefulWidget {
  final String email;
  final String name;

  const SignUpIdPwPage({Key? key, required this.email, required this.name})
      : super(key: key);

  @override
  ConsumerState<SignUpIdPwPage> createState() => _SignUpIdPwPageState();
}

class _SignUpIdPwPageState extends ConsumerState<SignUpIdPwPage> {
  late TextEditingController _idController;
  late TextEditingController _pwdController;
  late TextEditingController _pwdCheckController;

  RegExp regExp = RegExp(r'^(?=.*[!@#$%^&*])(?=.{1,20}$).*');

  IdDuplicateState idDuplicateState = IdDuplicateState.initial;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _idController.addListener(_updateIdField);
    _pwdController = TextEditingController();
    _pwdController.addListener(_updatePwdField);
    _pwdCheckController = TextEditingController();
    _pwdCheckController.addListener(_updatePwdField);
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwdController.dispose();
    _pwdCheckController.dispose();
    super.dispose();
  }

  void _updatePwdField() {
    ref.watch(idPwdButtonStateProvider.notifier).state = _pwdController.text.isNotEmpty && _pwdCheckController.text.isNotEmpty;
  }

  void _updateIdField() {
    ref.watch(idControllerProvider.notifier).state = _idController.text.isNotEmpty;
    ref.watch(idPwdButtonStateProvider.notifier).state =
        _idController.text.isNotEmpty && _pwdController.text.isNotEmpty && _pwdCheckController.text.isNotEmpty;
    ref.invalidate(
        idDuplicateViewModelProvider); // idController의 값이 바뀔때마다 provider 초기화
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(idDuplicateViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case IdDuplicateState.success:
          idDuplicateState = IdDuplicateState.success;
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('사용 가능한 아이디입니다.')));
        case IdDuplicateState.failure:
          idDuplicateState = IdDuplicateState.failure;
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('중복된 아이디입니다.')));
        default:
          idDuplicateState = IdDuplicateState.initial;
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
              "아이디와\n비밀번호를 입력해주세요.",
              MukGenColor.black,
            ),
            SizedBox(height: 24.h),
            MukGenTextField(
              width: 352,
              controller: _idController,
              hintText: "아이디",
              helperText: "최소 5자 최대 15자",
              color: MukGenColor.primaryLight2,
              suffix: GestureDetector(
                onTap: () {
                  ref.watch(idControllerProvider)
                      ? ref
                          .read(idDuplicateViewModelProvider.notifier)
                          .idDuplicate(accountId: _idController.text)
                      : null;
                },
                child: Container(
                  width: 84.w,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color: MukGenColor.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: MukGenColor.primaryLight2,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: PtdTextWidget.bodyStrong2(
                      "중복 확인",
                      MukGenColor.primaryDark2,
                    ),
                  ),
                ),
              ),
              fontSize: 20,
              isPwdTextField: false,
              maxLength: 15,
              autofocus: true,
            ),
            SizedBox(height: 24.h),
            MukGenTextField(
              width: 352,
              controller: _pwdController,
              fontSize: 20,
              hintText: "비밀번호",
              helperText: "특수문자 최소 1자 포함, 최대 20자",
              color: MukGenColor.primaryLight2,
              isPwdTextField: true,
              maxLength: 20,
              autofocus: false,
            ),
            SizedBox(height: 24.h),
            MukGenTextField(
              width: 352,
              controller: _pwdCheckController,
              fontSize: 20,
              hintText: "비밀번호 확인",
              isPwdTextField: true,
              maxLength: 20,
              autofocus: false,
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 34.h),
        child: MukGenButton(
          onPressed: () {
            if (ref.watch(idPwdButtonStateProvider)) {
              if (idDuplicateState == IdDuplicateState.initial) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('중복 여부를 확인해주세요.')));
              } else if (idDuplicateState == IdDuplicateState.success) {
                if (!regExp.hasMatch(_pwdController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('비밀번호가 조건에 맞지 않습니다.')));
                } else {
                  if (_pwdController.text != _pwdCheckController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('비밀번호가 일치하지 않습니다.')));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpNumberPage(
                          email: widget.email,
                          id: _idController.text,
                          password: _pwdController.text,
                          passwordCheck: _pwdCheckController.text,
                          name: widget.name,
                        ),
                      ),
                    );
                  }
                }
              } else if (idDuplicateState == IdDuplicateState.failure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('중복된 아이디입니다.')));
              }
            }
          },
          text: PtdTextWidget.bodyLarge2(
            "다음",
            MukGenColor.white,
          ),
          width: 352,
          height: 55,
          backgroundColor: ref.watch(idPwdButtonStateProvider) ? MukGenColor.primaryBase : MukGenColor.primaryLight2,
        ),
      ),
    );
  }
}