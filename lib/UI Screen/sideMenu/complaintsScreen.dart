import 'package:askun_delivery_app/Models/Sidemenu/complaint/complaintHistory.dart';
import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  final ScrollController _scrollController = ScrollController();
  bool isLoader = true;
  List<ComplaintHistoryResponse> complaintHistory = [];
  List<ComplaintHistoryMessage> complaintHistoryList = [];

  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getComplaintHistory();
  }

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
        child: isLoader
            ? Center(
          child: SpinKitFadingCircle(
            color: sideMenuColor,
          ),
        )
            : Column(
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
                itemCount: complaintHistoryList.length,
                itemBuilder: (context, index) {
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
                              size: 15,
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
                                      text:complaintHistoryList[index].lastActivity.toString(),
                                      fontFamily: MyStrings.poppins,
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: blackColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SmallText(
                                      text:
                                          '${MyStrings.ticketId} ${complaintHistoryList[index].ticketId}',
                                      fontWeight: FontWeight.w500,
                                      color: blackColor,
                                      size: 15,
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
                                    size: 15,
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
                                  '${MyStrings.ticketStatus} ${complaintHistoryList[index].isActive}',
                              fontWeight: FontWeight.w500,
                              size: 15,
                              fontFamily: MyStrings.poppins,
                              color: blackColor,
                            ),
                          const SizedBox(
                            height: 5,
                          ),
                            Divider(
                              color: dividerColor,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SmallText(
                              text:
                                  '${MyStrings.createdAt} ${complaintHistoryList[index].createdAt}',
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                              size: 15,
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
              const SizedBox(
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
                controller: subjectController,
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
                controller: messageController,
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
               if(messageController.text.isEmpty){
                 Fluttertoast.showToast(msg: 'Give Some Message');
               }
               else if(subjectController.text.isEmpty){
                 Fluttertoast.showToast(msg: 'Give Some Subject');
               }
               else{
                 _getRaiseTicket(context,subjectController.text,messageController.text);
               }
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

  void _getComplaintHistory() async {
    try {
      setState(() {
        isLoader = true;
      });
      final response = await Webservice().fetchComplaintHistory();

      if (response.status == true) {
        setState(() {
          complaintHistoryList = response.message!;
        });
      } else {
        // Handle error case here
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    setState(() {
      isLoader = false;
    });
  }

  _getRaiseTicket(BuildContext context,String subject,String message) async {
    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice().raisedComplaintService(subject: subject, message: message)
        .then((onResponse) async {
      stopLoader();
      if (kDebugMode) {
        print(onResponse!.message);
      }
      if (onResponse!.status = true) {
        await Future.delayed(const Duration(seconds: 2));
        Fluttertoast.showToast(msg: "Complaint Raised Successfully");
        setState(() {
          Navigator.pop(context);
        });

      } else {
        Fluttertoast.showToast(msg: "Failed to Login");
      }
    }).catchError((error) async {
      Fluttertoast.showToast(msg: "Time Out");
      stopLoader();
      if (kDebugMode) {
        print(error);
      }
    });
  }


  startLoader() {
    LoadingDialog.showLoaderDialog(context, 'Please Wait..');
  }

  stopLoader() {
    Navigator.of(context).pop();
  }
}
