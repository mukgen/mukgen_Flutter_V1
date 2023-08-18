import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/common/common.dart';
import 'package:mukgen_flutter_v1/model/user/profile_user.dart';
import 'package:mukgen_flutter_v1/screen/user/user_info_page.dart';
import 'package:mukgen_flutter_v1/service/get/user/get_user_profile_info.dart';
import 'package:mukgen_flutter_v1/widget/custom_icons.dart';
import 'package:mukgen_flutter_v1/widget/user/my_widget.dart';
import 'package:transition/transition.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Future<ProfileUser>? profileUser;

  @override
  void initState() {
    super.initState();
    profileUser = getUserProfileInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MukGenColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MukGenColor.white,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: MukGenColor.primaryLight1,
              size: 20.0.sp,
            ),
          ),
        ),
        title: Text(
          "마이페이지",
          style: TextStyle(
            color: MukGenColor.primaryLight1,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'MukgenSemiBold',
          ),
        ),
      ),
      body: FutureBuilder(
        future: profileUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final profileUser = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 10.0.h),
                SizedBox(
                  height: 100.0.h,
                  width: 393.0.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 30.0.w),
                          Stack(
                            children: [
                              SizedBox(
                                width: 80.0.h,
                                height: 80.0.h,
                                child: profileUser.profileUrl == null
                                    ? const CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/SpoonProfile.png'),
                                )
                                    : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    profileUser.profileUrl.toString(),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.h,
                                right: 0.w,
                                child: Container(
                                  height: 25.33.h,
                                  width: 25.33.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2.0.w,
                                      color: MukGenColor.white,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: MukGenColor.pointLight1,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 10.sp,
                                        color: MukGenColor.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0.w),
                          Text(
                            profileUser.name.toString(),
                            style: TextStyle(
                              color: MukGenColor.black,
                              fontSize: 20.sp,
                              fontFamily: 'MukgenSemiBold',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            Transition(
                              child: const UserInfoPage(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              '회원 정보',
                              style: TextStyle(
                                color: MukGenColor.primaryLight2,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'MukgenRegular',
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: MukGenColor.primaryLight2,
                              size: 12.sp,
                            ),
                            SizedBox(width: 30.0.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0.h),
                Container(
                  color: MukGenColor.primaryLight3,
                  height: 6.0.h,
                  width: 393.0.w,
                ),
                SizedBox(height: 10.0.h),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 30.0.w),
                        Text(
                          '내 작성글',
                          style: TextStyle(
                            color: MukGenColor.black,
                            fontSize: 16.sp,
                            fontFamily: 'MukgenSemiBold',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyWidget(title: '내 리뷰', icon: Icons.star_outline),
                        MyWidget(title: '내 게시글', icon: CustomIcons.board),
                        MyWidget(title: '내 급식 건의', icon: CustomIcons.vector),
                        MyWidget(title: '내 배달 파티', icon: Icons.groups),
                      ],
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
