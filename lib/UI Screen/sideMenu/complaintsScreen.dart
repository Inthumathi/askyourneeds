import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Complaints {
  final String timeSlot;

  final String ticketID;
  final String status;

  final String createdDate;

  Complaints({
    required this.timeSlot,
    required this.ticketID,
    required this.status,
    required this.createdDate,
  });
}

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  List<Complaints> complaintsList = <Complaints>[
    Complaints(
      timeSlot: '12-03-2020',
      ticketID: 'TKT00000003',
      status: 'Open',
      createdDate: '12-06-2020, 11:30 PM',
    ),
    Complaints(
      timeSlot: '12-03-2020',
      ticketID: 'TKT00000003',
      status: 'Open',
      createdDate: '12-06-2020, 11:30 PM',
    ),
    Complaints(
      timeSlot: '12-03-2020',
      ticketID: 'TKT00000003',
      status: 'Open',
      createdDate: '12-06-2020, 11:30 PM',
    ),
    Complaints(
      timeSlot: '12-03-2020',
      ticketID: 'TKT00000003',
      status: 'Open',
      createdDate: '12-06-2020, 11:30 PM',
    ),
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        title: SmallText(
            text: MyStrings.complaints.tr().toUpperCase(),
            fontFamily: MyStrings.aclonica),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 15),
                  child: SmallText(
                      text: MyStrings.raiseATicket,
                      color: whiteColor,
                      fontFamily: MyStrings.poppins),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: complaintsList.length,
                itemBuilder: (context, index) {
                  Complaints item = complaintsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: MyStrings.provideTimeSlotFor,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      text: item.timeSlot,
                                      fontFamily: MyStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                      color: blackColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SmallText(
                                      text:
                                          '${MyStrings.ticketId} ${item.ticketID}',
                                      fontWeight: FontWeight.w500,
                                      color: blackColor,
                                      fontFamily: MyStrings.poppins,
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: secondPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    minimumSize: const Size(70.0, 44.0),
                                  ),
                                  child: SmallText(
                                    text: MyStrings.view,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: MyStrings.poppins,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SmallText(
                              text:
                                  '${MyStrings.ticketStatus} ${item.status.toUpperCase()}',
                              fontWeight: FontWeight.w500,
                              fontFamily: MyStrings.poppins,
                              color: blackColor,
                            ),
                            heightSpace,
                            Divider(
                              color: dividerColor,
                              thickness: 1,
                            ),
                            heightSpace,
                            SmallText(
                              text:
                                  '${MyStrings.createdAt} ${item.createdDate}',
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                              fontFamily: MyStrings.poppins,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              Center(
                child: SmallText(
                  text: MyStrings.raiseATicket,
                  fontFamily: MyStrings.poppins,
                  size: 20,
                  color: secondPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: dividerColor,
                thickness: 1,
              ),
              SizedBox(
                height: 30,
              ),
              SmallText(
                text: MyStrings.ticketSubject,
                fontWeight: FontWeight.w500,
                color: blackColor,
                fontFamily: MyStrings.poppins,
              ),
              heightSpace,
              TextField(
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dividerColor, // Set the border color here
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dividerColor, // Set the focused border color here
                    ),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              SmallText(
                text: MyStrings.ticketMessage,
                fontWeight: FontWeight.w500,
                fontFamily: MyStrings.poppins,
                color: blackColor,
              ),
              heightSpace,
              TextField(
                cursorColor: primaryColor,
                maxLines: 4,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  hoverColor: primaryColor,
                  focusColor: primaryColor,
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dividerColor, // Set the border color here
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dividerColor, // Set the focused border color here
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 30,right: 10,left: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add your submit button logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),

                padding: const EdgeInsets.all(16),
              ),
              child: SmallText(
                  text: MyStrings.submit,
                  fontFamily: MyStrings.poppins,
                  color: whiteColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
