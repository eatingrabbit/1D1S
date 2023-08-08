import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';

class ODOSProfileCard extends StatelessWidget {
  final String userName;
  final String userProfileImage;
  final int longestStreakNumber;
  final int successfulGoalNumber;
  final bool isStreakCurrentlyMaintaining;
  final String aboutMe;

  const ODOSProfileCard({
    super.key,
    required this.userName,
    required this.userProfileImage,
    required this.longestStreakNumber,
    required this.successfulGoalNumber,
    required this.isStreakCurrentlyMaintaining,
    required this.aboutMe
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 279,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 20
          )
        ]
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(  // *Profile Image*
                  margin: EdgeInsets.fromLTRB(15, 0, 38, 0),
                  child: CircleAvatar(
                    backgroundColor: AppColors.black,
                    radius: 60.0, //외부 원의 반지름
                    child: CircleAvatar(
                      backgroundImage: AssetImage(userProfileImage),
                      radius: 57.0, //내부 원의 반지름
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(  // *Profile Head*
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(userName, style: profileCardHead),
                          EditButton(onPressed: (){}),
                        ],
                      ),
                      Row(  // *Streak*
                        children: [
                          Text('최고 스트릭', style: profileCardRecordHead),
                          Container(
                            width: 47,
                            margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                            child: Text('$longestStreakNumber일', style: profileCardRecordContent)
                          ),
                          isStreakCurrentlyMaintaining ? Image.asset(
                            'images/icon_fire.png',
                            width: 16,
                            height: 16,
                          ) : SizedBox.shrink()
                        ],
                      ),
                      Row(  // *Successful Goal*
                        children: [
                          Text('성공한 목표', style: profileCardRecordHead),
                          Container(
                            margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                            child: Text('$successfulGoalNumber개', style: profileCardRecordContent)
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 1.0,
            color: Color(0xffc8c8c8),
          ),  // *Line Divider*
          Container(  // *About Me*
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Row(  // *Profile Head*
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('자기소개', style: profileCardAboutMeHead),
                      EditButton(onPressed: (){}),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    aboutMe,  //자기소개는 36자 이하로
                    style: profileCardAboutMeContent,
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class EditButton extends StatelessWidget {
  final Function() onPressed;
  const EditButton({super.key, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(left: 4),
      width: 15,
      height: 15,
      alignment: Alignment.center,
      child: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: (){},
          icon: SvgPicture.asset(
            AppString.goal,
            colorFilter: ColorFilter.mode(Color(0xffababab), BlendMode.srcIn),
          )
      ),
    );
  }
}