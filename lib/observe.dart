import 'package:flutter_bloc/flutter_bloc.dart';

class Observer extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print("Create :: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    print("Close :: $bloc");
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }
}