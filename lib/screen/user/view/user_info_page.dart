import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mukgen_flutter_v1/core/constant/mukgen_color.dart';
import 'package:mukgen_flutter_v1/model/user/profile_user.dart';
import 'package:mukgen_flutter_v1/service/user_service.dart';
import 'package:mukgen_flutter_v1/screen/widget/user/user_info_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  Future<ProfileUser>? profileUser;

  @override
  void initState() {
    super.initState();
    profileUser = UserService.getUserProfileInfo();
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
      body: Column(
        children: [
          SizedBox(height: 20.0.h),
          Row(
            children: [
              SizedBox(width: 20.0.w),
              Text(
                '회원 정보',
                style: TextStyle(
                  color: MukGenColor.primaryDark1,
                  fontSize: 20.sp,
                  fontFamily: 'MukgenSemiBold',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0.h),
          FutureBuilder(
            future: profileUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final profileUser = snapshot.data!;
                return Column(
                  children: [
                    SizedBox(height: 16.0.h),
                    UserInfoWidget(
                        title: '아이디',
                        content: profileUser.accountId.toString()),
                    SizedBox(height: 42.0.h),
                    UserInfoWidget(
                        title: '이메일', content: profileUser.mail.toString()),
                    SizedBox(height: 42.0.h),
                    UserInfoWidget(
                        title: '전화번호',
                        content: profileUser.phoneNumber.toString()),
                  ],
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
    );
  }
}
