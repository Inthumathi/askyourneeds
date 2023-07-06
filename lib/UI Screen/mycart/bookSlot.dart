import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:askun_delivery_app/utilities/date.dart' as date_util;

class BookTime {
  final String timeSlot;
  final String personCount;
  final String slotStatus;
  BookTime({
    required this.timeSlot,
    required this.personCount,
    required this.slotStatus,
  });
}

class BookSlotScreen extends StatefulWidget {
  const BookSlotScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BookSlotScreenState createState() => _BookSlotScreenState();
}

class _BookSlotScreenState extends State<BookSlotScreen> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  List<BookTime> timeList = <BookTime>[
    BookTime(
      timeSlot: '08:00 AM - 09:00 AM',
      personCount: '3',
      slotStatus: 'Available',
    ),
    BookTime(
      timeSlot: '09:00 AM - 10:00 AM',
      personCount: '1',
      slotStatus: 'Available',
    ),
    BookTime(
      timeSlot: '09:00 AM - 10:00 AM',
      personCount: '0',
      slotStatus: 'Booked',
    ),
    BookTime(
      timeSlot: '10:00 AM - 11:00 AM',
      personCount: '3',
      slotStatus: 'Available',
    ),
    BookTime(
      timeSlot: '11:00 AM - 12:00 PM',
      personCount: '3',
      slotStatus: 'Available',
    ),
  ];

  @override
  void initState() {
    currentDateTime = DateTime.now();
    currentMonthList = generateDates(currentDateTime);
    scrollController = ScrollController();
    super.initState();
  }

  List<DateTime> generateDates(DateTime currentDateTime) {
    List<DateTime> dateList = [];
    DateTime startDate = DateTime(
        currentDateTime.year, currentDateTime.month, currentDateTime.day);
    DateTime endDate = currentDateTime.add(const Duration(days: 5));

    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 1))) {
      dateList.add(date);
    }

    return dateList;
  }

  Widget capsuleView(int index) {
    bool isSelected = currentMonthList[index].day == currentDateTime.day;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
          });
        },
        child: Card(
          elevation: isSelected ? 7 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              color: (currentMonthList[index].day != currentDateTime.day)
                  ? whiteColor
                  : secondPrimaryColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: (currentMonthList[index].day != currentDateTime.day)
                      ? blackColor
                      : Colors.transparent),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SmallText(
                    text: currentMonthList[index].day.toString(),
                    fontFamily: MyStrings.aclonica,
                    size: 15,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? blackColor
                        : whiteColor,
                  ),
                  SmallText(
                    text: date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    fontFamily: MyStrings.aclonica,
                    size: 14,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? blackColor
                        : whiteColor,
                  ),
                  SmallText(
                    text: date_util
                        .DateUtils.months[currentMonthList[index].month - 1]
                        .substring(0, 3),
                    fontFamily: MyStrings.aclonica,
                    size: 15,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? blackColor
                        : whiteColor,
                  ),
                  // Text(
                  //   currentMonthList[index].year.toString(),
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //     color: (currentMonthList[index].day != currentDateTime.day)
                  //         ? Colors.deepPurple
                  //         : Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget horizontalCapsuleListView() {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(
          text: MyStrings.chooseTimeSlot.toUpperCase(),
          color: whiteColor,
          fontFamily: MyStrings.aclonica,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Row(
              children: [
                SmallText(
                    text: MyStrings.serviceType,
                    fontWeight: FontWeight.w500,
                    fontFamily: MyStrings.aclonica),
                widthSpace,
                SmallText(
                    text: MyStrings.electrician,
                    fontWeight: FontWeight.w500,
                    fontFamily: MyStrings.aclonica),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SmallText(
                    text: MyStrings.available,
                    fontWeight: FontWeight.w500,
                    fontFamily: MyStrings.aclonica),
                widthSpace,
                SmallText(
                    text: '3',
                    fontWeight: FontWeight.w500,
                    fontFamily: MyStrings.aclonica),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      horizontalCapsuleListView(),
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 2,
                        color: dividerColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        itemCount: timeList.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallText(
                                          text: timeList[index].timeSlot,
                                          fontWeight: FontWeight.bold,
                                          size: 13,
                                          fontFamily: MyStrings.aclonica,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: timeList[index]
                                                              .slotStatus ==
                                                          'Available'
                                                      ? successColor
                                                      : failureColor,
                                                  borderRadius:
                                                      BorderRadius.circular(100)
                                                  //more than 50% of width makes circle
                                                  ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            SmallText(
                                              text: timeList[index].slotStatus,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  timeList[index].slotStatus ==
                                                          'Available'
                                                      ? blackColor
                                                      : failureColor,
                                              size: 12,
                                              fontFamily: MyStrings.aclonica,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SmallText(
                                          text: timeList[index].personCount,
                                          fontWeight: FontWeight.bold,
                                          size: 14,
                                          color: timeList[index].slotStatus ==
                                                  'Available'
                                              ? blackColor
                                              : failureColor,
                                          fontFamily: MyStrings.aclonica,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        SmallText(
                                          text: 'Spots Left',
                                          fontWeight: FontWeight.w500,
                                          size: 12,
                                          color: timeList[index].slotStatus ==
                                                  'Available'
                                              ? blackColor
                                              : failureColor,
                                          fontFamily: MyStrings.aclonica,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: dividerColor.withOpacity(0.6),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                        text: MyStrings.emergency.toUpperCase(),
                        color: failureColor,
                        fontFamily: MyStrings.poppins,
                        fontWeight: FontWeight.w500),
                    Divider(
                      thickness: 1,
                      color: dividerColor,
                    ),
                    ListView.builder(
                      itemCount: timeList.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(
                                        text: timeList[index].timeSlot,
                                        fontWeight: FontWeight.bold,
                                        size: 13,
                                        fontFamily: MyStrings.aclonica,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                color: timeList[index]
                                                            .slotStatus ==
                                                        'Available'
                                                    ? successColor
                                                    : failureColor,
                                                borderRadius:
                                                    BorderRadius.circular(100)
                                                //more than 50% of width makes circle
                                                ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SmallText(
                                            text: timeList[index].slotStatus,
                                            fontWeight: FontWeight.w500,
                                            color: timeList[index].slotStatus ==
                                                    'Available'
                                                ? blackColor
                                                : failureColor,
                                            size: 12,
                                            fontFamily: MyStrings.aclonica,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(
                                        text: timeList[index].personCount,
                                        fontWeight: FontWeight.bold,
                                        size: 14,
                                        color: timeList[index].slotStatus ==
                                                'Available'
                                            ? blackColor
                                            : failureColor,
                                        fontFamily: MyStrings.aclonica,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      SmallText(
                                        text: 'Spots Left',
                                        fontWeight: FontWeight.w500,
                                        size: 12,
                                        color: timeList[index].slotStatus ==
                                                'Available'
                                            ? blackColor
                                            : failureColor,
                                        fontFamily: MyStrings.aclonica,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: dividerColor.withOpacity(0.6),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
