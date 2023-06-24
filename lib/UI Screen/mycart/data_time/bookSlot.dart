import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utilites/constant.dart';
import '../../../widget/smalltext.dart';
import 'calander/calenderScreen.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({Key? key}) : super(key: key);

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: selectedSubCategoriesBgColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: SmallText(
              text: MyStrings.chooseTimeSlot.tr().toUpperCase(),
              size: 16,
              fontFamily: MyStrings.poppins),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.search),
          //     onPressed: () {
          //       // Handle search action here
          //     },
          //   ),
          //   IconButton(
          //     icon: const Icon(Icons.notifications),
          //     onPressed: () {
          //       // Handle notification action here
          //     },
          //   ),
          // ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(
                      text: MyStrings.serviceType,
                      fontFamily: MyStrings.aclonica,
                      fontWeight: FontWeight.w500),
                  widthSpace,
                  SmallText(
                      text: MyStrings.electrician,
                      fontFamily: MyStrings.aclonica,
                      fontWeight: FontWeight.w500),
                ],
              ),
              heightSpace,
              Row(
                children: [
                  SmallText(
                      text: MyStrings.serviceType,
                      fontFamily: MyStrings.poppins,
                      fontWeight: FontWeight.w500),
                  widthSpace,
                  SmallText(
                      text: "3",
                      fontFamily: MyStrings.poppins,
                      fontWeight: FontWeight.w500)
                ],
              ),
              heightSpace,
              CalendarWeek(
                controller: _controller,

                showMonth: true,
                minDate: DateTime.now().add(
                  Duration(days: 0),
                ),
                maxDate: DateTime.now().add(
                  Duration(days: 5),
                ),
                onDatePressed: (DateTime datetime) {
                  // Do something
                  setState(() {});
                },
                onDateLongPressed: (DateTime datetime) {
                  // Do something
                },
                onWeekChanged: () {
                  // Do something
                },
                monthViewBuilder: (DateTime time) => Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, bottom: 20, top: 10),
                  child: Center(
                    child: SmallText(
                        text: DateFormat.MMMM().format(time),
                        color: primaryColor,
                        fontFamily: MyStrings.aclonica,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
