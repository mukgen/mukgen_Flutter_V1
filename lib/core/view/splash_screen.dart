import 'package:flutter/material.dart';
import 'package:mukgen_flutter_v1/core/component/text/pretendard/ptd_text_widget.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: Center(
        // child: TitleLarge(
        //   customText: CustomText(
        //     text: 'MUKGEN',
        //     color: MukGenColor.primaryLight1,
        //   ),
        // ),
        child: PtdTextWidget.titleLarge(
          'MUKGEN',
          MukGenColor.primaryLight1,
        ),
      ),
    );
  }
}
