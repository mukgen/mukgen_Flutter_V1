import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/delivery/list_delivery-party.dart';
import 'package:mukgen_flutter_v1/service/get/delivery/get_list_delivery-party_info.dart';
import 'package:mukgen_flutter_v1/widget/delivery_party_check.dart';

class MainDeliveryPartyPage extends StatefulWidget {
  const MainDeliveryPartyPage({Key? key, required this.onFood}) : super(key: key);

  final VoidCallback onFood;

  @override
  State<MainDeliveryPartyPage> createState() => _MainDeliveryPartyPageState();
}

class _MainDeliveryPartyPageState extends State<MainDeliveryPartyPage> with SingleTickerProviderStateMixin {
  Future<ListDeliveryParty>? listDeliveryParty;
  @override
  Widget build(BuildContext context) {
    listDeliveryParty = getListDeliveryPartyInfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MukGenColor.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '배달 파티',
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
            heroTag: 'adddelivery',
            onPressed: () {
              widget.onFood();
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