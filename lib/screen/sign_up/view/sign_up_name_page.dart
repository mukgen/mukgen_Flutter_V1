import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/controller_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/view/sign_up_id_pw_page.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_button.dart';
import 'package:mukgen_flutter_v1/screen/widget/mukgen_text_field.dart';

class SignUpNamePage extends ConsumerStatefulWidget {
  final String email;

  const SignUpNamePage({Key? key, required this.email}) : super(key: key);

  @override
  ConsumerState<SignUpNamePage> createState() => _SignUpNamePageState();
}

class _SignUpNamePageState extends ConsumerState<SignUpNamePage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    ref.read(nameButtonProvider.notifier).state =
        _nameController.text.isNotEmpty;
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            PtdTextWidget.title(
              "별명을 입력해주세요.",
              MukGenColor.black,
            ),
            SizedBox(height: 24.h),
            MukGenTextField(
              width: 352,
              controller: _nameController,
              hintText: "별명",
              helperText: "최대 8자",
              color: MukGenColor.primaryLight2,
              fontSize: 20,
              isPwdTextField: false,
              maxLength: 8,
              autofocus: true,
            ),
            const Spacer(),
            MukGenButton(
              onPressed: () {
                ref.watch(nameButtonProvider) ?
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpIdPwPage(
                                email: widget.email,
                                name: _nameController.text)))
                    : null;
              },
              backgroundColor: ref.watch(nameButtonProvider)
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