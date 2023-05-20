import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
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
      backgroundColor: Color(0xffE3E3E3),
      appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: SmallText(text: MyStrings.notifications.toUpperCase())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/notification/EmptyNotification.png'),
              width: 250,
              height: 200,
            ),
          ),
          heightSpace,
          SmallText(
            text: MyStrings.noNotifications,
            fontWeight: FontWeight.w500,
            size: 18,
          ),
        ],
      ),
    );
  }
}
