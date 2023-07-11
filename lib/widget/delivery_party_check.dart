import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/delivery/list_delivery-party.dart';
import 'package:mukgen_flutter_v1/service/get/delivery/get_list_delivery-party_info.dart';
import 'package:mukgen_flutter_v1/service/post/delivery/post_join_delivery-party_info.dart';

class DeliveryPartyCheck extends StatefulWidget {
  const DeliveryPartyCheck({Key? key}) : super(key: key);

  @override
  State<DeliveryPartyCheck> createState() => _DeliveryPartyCheckState();
}

class _DeliveryPartyCheckState extends State<DeliveryPartyCheck> with SingleTickerProviderStateMixin {
  Future<ListDeliveryParty>? listDeliveryParty;

  bool isExpanded = false;
  bool isEntered = false;
  late AnimationController animationController;
  late Animation<double> animation;

  int selectedContainerIndex = -1;

  @override
  void initState() {
    super.initState();
    listDeliveryParty = getListDeliveryPartyInfo();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void toggleExpansion(int index) {
    if (!isEntered) {
      setState(() {
        if (selectedContainerIndex == index) {
          selectedContainerIndex = -1;
        } else {
          selectedContainerIndex = index;
        }
        if (isExpanded) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
      });
    }
  }

  String meetTime(String timeString) {
    DateTime dateTime = DateTime.parse(timeString);
    String amPm = DateFormat('a').format(dateTime) == 'AM' ? '오전' : '오후';
    String formattedTime = DateFormat('h:mm').format(dateTime);
    return '$amPm $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0.h),
            SizedBox(
              height: 600.0.h,
              width: double.infinity,
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    listDeliveryParty = getListDeliveryPartyInfo();

                  });
                },
                child: Column(
                  children: [
                    FutureBuilder(
                      future: listDeliveryParty,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.deliveryPartyResponseList!.length,
                              itemBuilder: (context, index) {
                                final bool isSelected = selectedContainerIndex == index;
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (!isEntered) {
                                          toggleExpansion(index);
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 200),
                                            curve: Curves.easeInOut,
                                            height: isSelected ? 191.0.h : 90.0.h,
                                            width: 353.0.w,
                                            decoration: BoxDecoration(
                                              color: isEntered ? MukGenColor.pointLight1 : MukGenColor.primaryLight3,
                                              borderRadius: BorderRadius.circular(10.r),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 81.0.h,
                                                  width: 353.0.w,
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(height: 15.0.h),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 16.0.w),
                                                            height: 60.0.h,
                                                            width: 60.0.w,
                                                            child: CircleAvatar(
                                                              radius: 100.r,
                                                              backgroundImage: NetworkImage(
                                                                snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index].profileUrl.toString(),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 10.0.w),
                                                      Column(
                                                        children: [
                                                          SizedBox(height: 15.0.h),
                                                          SizedBox(
                                                            width: 251.0.w,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width: 5.0.w),
                                                                Text(
                                                                  snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index].name.toString(),
                                                                  style: TextStyle(
                                                                    color: MukGenColor.black,
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontFamily: 'InterBold',
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                Text(
                                                                  '${snapshot.data!.deliveryPartyResponseList![index].curParticipantNumber.toString()} / ${snapshot.data!.deliveryPartyResponseList![index].participantNumber.toString()}',
                                                                  style: TextStyle(
                                                                    color: MukGenColor.black,
                                                                    fontSize: 12.sp,
                                                                    fontFamily: 'InterBold',
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 5.0.w),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 4.0.h),
                                                          SizedBox(
                                                            width: 251.0.w,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width: 5.0.w),
                                                                Text(
                                                                  snapshot.data!.deliveryPartyResponseList![index].menu.toString(),
                                                                  style: TextStyle(
                                                                    color: MukGenColor.black,
                                                                    fontSize: 14.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: 'MukgenRegular',
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 4.0.h),
                                                          SizedBox(
                                                            width: 251.0.w,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(width: 5.0.w),
                                                                Text(
                                                                  '${snapshot.data!.deliveryPartyResponseList![index].place.toString()}ㅣ${meetTime(snapshot.data!.deliveryPartyResponseList![index].meetTime.toString())}',
                                                                  style: TextStyle(
                                                                    color: MukGenColor.primaryBase,
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: 'MukgenRegular',
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (isSelected)
                                            Positioned(
                                              bottom: 53.0.h,
                                              left: 16.0.w,
                                              child: AnimatedOpacity(
                                                duration: const Duration(milliseconds: 200),
                                                opacity: isSelected ? 1.0 : 0.0,
                                                curve: Curves.easeInOut,
                                                child: SizedBox(
                                                  height: isSelected ? 46.0.h : 0.0.h,
                                                  width: 321.0.w,
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList!.length - 1,
                                                    itemBuilder: (context, index1) {
                                                      return Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 36.0.w,
                                                            height: 46.0.h,
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 30.0.h,
                                                                  width: 30.0.w,
                                                                  child: snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index1 + 1].profileUrl != null
                                                                      ? CircleAvatar(
                                                                    radius: 100.r,
                                                                    backgroundImage: NetworkImage(snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index1 + 1].profileUrl.toString()),
                                                                  )
                                                                      : CircleAvatar(
                                                                    radius: 100.r,
                                                                    backgroundImage: const AssetImage('assets/images/defaultProfile.png'),
                                                                    backgroundColor: MukGenColor.primaryLight2,
                                                                  ),

                                                                ),
                                                                Text(
                                                                  snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index1+1].name!.length > 3 ? '${snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index1+1].name!.substring(0, 3)}...' : snapshot.data!.deliveryPartyResponseList![index].userInfoResponseList![index1+1].name.toString(),
                                                                  overflow: TextOverflow.ellipsis,
                                                                  maxLines: 1,
                                                                  style: TextStyle(
                                                                    color: MukGenColor.black,
                                                                    fontSize: 12.sp,
                                                                    fontWeight: FontWeight.w400,
                                                                    fontFamily: 'MukgenRegular',
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(width: 6.0.w),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Positioned(
                                            bottom: 8.0.h,
                                            left: 16.0.w,
                                            child: GestureDetector(
                                              onTap: () {
                                                postJoinDeliveryParty(snapshot.data!.deliveryPartyResponseList![index].deliveryPartyId!.toInt());
                                              },
                                              child: AnimatedOpacity(
                                                duration: const Duration(milliseconds: 200),
                                                opacity: isSelected ? 1.0 : 0.0,
                                                curve: Curves.easeInOut,
                                                child: Container(
                                                  height: isSelected ? 39.0.h : 0.0.h,
                                                  width: 321.0.w,
                                                  decoration: BoxDecoration(
                                                    color: MukGenColor.pointLight1,
                                                    borderRadius: BorderRadius.circular(10.r),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '참여하기',
                                                      style: TextStyle(
                                                        color: MukGenColor.white,
                                                        fontSize: 16.sp,
                                                        fontFamily: 'MukgenSemiBold',
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8.0.h),
                                  ],
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                        } else {
                        return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
