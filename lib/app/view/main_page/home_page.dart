import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/controller/main/home_page_controller.dart';
import 'package:one_day_one_something/app/view/common/list_cells/odos_friend_list_cell.dart';
import 'package:one_day_one_something/app/view/common/list_cells/odos_friend_request_alarm.dart';
import 'package:one_day_one_something/app/view/common/list_cells/odos_streak_alarm.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card_list.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class HomePage extends BaseView<HomePageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseHomePage(
      everyoneSGoalList: controller.everyoneSGoalList,
      everyoneSTrackList: controller.everyoneSTrackList
    );
  }
}

class BaseHomePage extends StatelessWidget {
  final List everyoneSGoalList;
  final List everyoneSTrackList;
  const BaseHomePage(
      {super.key,
      required this.everyoneSGoalList,
      required this.everyoneSTrackList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: UniqueKey(),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              ODOSFriendRequestAlarm(friendName: '고라니',),
              SizedBox(height: 10,),
              ODOSStreakAlarm(streakNumber: 50),
              SizedBox(height: 10,),
              ODOSFriendListCell(
                friendName: '고라니',
                friendsRequestCode: null,
              ),
              SizedBox(height: 10,),
              ODOSFriendListCell(
                friendName: '고라니',
                friendsRequestCode: FriendsRequestCode.SENT,
              ),
              SizedBox(height: 10,),
              ODOSFriendListCell(
                friendName: '고라니',
                friendsRequestCode: FriendsRequestCode.ACCEPT,
              ),
              everyoneSTrackList.isEmpty ?
              Center(
                child: Text(AppString.str_empty_track_list, style: everyoneSGoalButtonTextStyle,),
              ) : ODOSTrackCardList(everyoneSTrackList: everyoneSTrackList,)
            ],
          ),
        ],
      ),
    );
  }
}
