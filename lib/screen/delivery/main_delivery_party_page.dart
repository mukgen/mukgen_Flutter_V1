import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/delivery/list_delivery-party.dart';
import 'package:mukgen_flutter_v1/screen/delivery/delivery_what_food_page.dart';
import 'package:mukgen_flutter_v1/service/get/delivery/get_list_delivery-party_info.dart';
import 'package:mukgen_flutter_v1/widget/delivery_party_check.dart';
import 'package:transition/transition.dart';

class MainDeliveryPartyPage extends StatefulWidget {
  const MainDeliveryPartyPage({Key? key}) : super(key: key);

  @override
  State<MainDeliveryPartyPage> createState() => _MainDeliveryPartyPageState();
}

class _MainDeliveryPartyPageState extends State<MainDeliveryPartyPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '배달파티',
          style: TextStyle(
            color: MukGenColor.primaryLight1,
            fontSize: 20.sp,
            fontFamily: 'MukGenSemiBold',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: DeliveryPartyCheck(),
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