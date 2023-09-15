import 'package:flarelane_flutter/flarelane_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/observe.dart';
import 'package:mukgen_flutter_v1/screen/sign_in/bloc/sign_in_bloc.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/bloc/sign_up_bloc.dart';
import 'package:mukgen_flutter_v1/screen/starting_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mukgen_flutter_v1/secret.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  String flareLaneKey = getFlareLaneKey(); // 별도의 함수를 사용해 키를 가져옴
  FlareLane.shared.initialize(flareLaneKey);
  Bloc.observer = Observer();
  initializeDateFormatting().then((_) {
    Intl.defaultLocale = 'ko_KR';
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(const MyApp());
    });
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    Future.delayed(const Duration(milliseconds: 1000)).then((_) =>
        FlutterNativeSplash.remove());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) =>
            MaterialApp(
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },
              home: const StartingPage(),
              debugShowCheckedModeBanner: false,
            ),
      ),
    );
  }
}
