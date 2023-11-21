import 'package:flarelane_flutter/flarelane_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:mukgen_flutter_v1/screen/starting_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mukgen_flutter_v1/secret.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlareLane.shared.initialize(getFlareLaneKey());
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await initializeDateFormatting();
  Intl.defaultLocale = 'ko_KR';

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'Pretendard',
        ),
        home: const StartingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
