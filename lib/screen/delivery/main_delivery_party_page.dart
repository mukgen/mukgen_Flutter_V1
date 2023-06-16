import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_what_food_page.dart';
import 'package:transition/transition.dart';

class MainDeliveryPartyPage extends StatefulWidget {
  const MainDeliveryPartyPage({Key? key}) : super(key: key);

  @override
  State<MainDeliveryPartyPage> createState() => _MainDeliveryPartyPageState();
}

class _MainDeliveryPartyPageState extends State<MainDeliveryPartyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      floatingActionButton: SizedBox(
        width: 70.0.w,
        height: 70.0.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                Transition(
                  child: const DeliveryWhatFoodPage(),
                  transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                ),
              );
            },
            elevation: 0,
            backgroundColor: MukGenColor.pointBase,
            child: Icon(Icons.add, size: 30.0.sp, color: MukGenColor.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
