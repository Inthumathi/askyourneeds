import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: SmallText(text: MyStrings.notifications.tr().toUpperCase())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/notification/EmptyNotification.png'),
              width: 250,
              height: 200,
            ),
          ),
          heightSpace,
          SmallText(
            text: MyStrings.noNotifications.tr(),
            fontWeight: FontWeight.w500,
            size: 18,
          ),
        ],
      ),
    );
  }
}
