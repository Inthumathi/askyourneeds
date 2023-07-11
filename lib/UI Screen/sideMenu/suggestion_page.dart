import 'package:askun_delivery_app/services/service.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Suggestion {
  final String product;
  final String status;
  final String productDescription;


  Suggestion({
    required this.product,
    required this.status,
    required this.productDescription,
  });
}

class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

final ScrollController _scrollController = ScrollController();

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  List<Suggestion> suggestionList = <Suggestion>[
    Suggestion(
      product: 'Sensodyne 250gm Toothpaste ',
      status: 'Added',
      productDescription: 'Add sensodyne toothpaste of 250gm.It provides sensitivity protection plus.',

    ),
    Suggestion(
      product: 'Beef Meat',
      status: 'Not added',
      productDescription: 'Add beef meat into the products.',
    ),
    Suggestion(
      product: 'Amrutha Tiffins',
      status: 'Added',
      productDescription: 'Add amrutha tiffins fo a  tasty breakfast. All the prices are affordable.',
    ),

  ];


  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: SmallText(
          text: MyStrings.suggestion.toUpperCase(),
          fontFamily: MyStrings.aclonica,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        text: MyStrings.addASuggestion,
                        color: whiteColor,
                        fontFamily: MyStrings.poppins),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SmallText(
                  text: MyStrings.previousSuggestions.toUpperCase(),
                  fontFamily: MyStrings.poppins,
                  fontWeight: FontWeight.w500,
                  color: primaryColor),
              heightSpace,
              heightSpace,
              ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: suggestionList.length,
                itemBuilder: (context, index) {
                  Suggestion item = suggestionList[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30.0), // Add spacing here
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightSpace,
                            heightSpace,
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: SmallText(
                                    text: item.product,
                                    fontFamily: MyStrings.poppins,
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                widthSpace,
                                SmallText(
                                  text: item.status,
                                  fontFamily: MyStrings.poppins,
                                  color: item.status == 'Added'? blackColor :redColor,
                                  fontWeight: FontWeight.w500,
                                ), // Remove the colon here
                              ],
                            ),
                            heightSpace,
                            Divider(
                              color: dividerColor,
                              thickness: 1,
                            ),
                            heightSpace,
                            SmallText(
                              text:  item.productDescription,
                              fontFamily: MyStrings.poppins,
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                            ),
                            heightSpace,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              heightSpace,
              heightSpace,
            ],
          ),
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
                  text: MyStrings.suggestAProduct,
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
                text: MyStrings.enterProductName,
                fontWeight: FontWeight.w600,
                color: blackColor,
                fontFamily: MyStrings.poppins,
              ),
              heightSpace,
              TextField(
                cursorColor: primaryColor,
                controller: productNameController,
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
                text: MyStrings.enterProductDescription,
                fontWeight: FontWeight.w600,
                fontFamily: MyStrings.poppins,
                color: blackColor,
              ),
              heightSpace,
              TextField(
                cursorColor: primaryColor,
                controller: productDescriptionController,
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
          padding: const EdgeInsets.only(bottom: 30, right: 10, left: 10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if(productNameController.text.isEmpty){
                  Fluttertoast.showToast(msg: 'Give Some Product Name');
                }
                else if(productDescriptionController.text.isEmpty){
                  Fluttertoast.showToast(msg: 'Give Some product Description');
                }
                else{
                  _getRaiseSuggestion(context,productNameController.text,productDescriptionController.text);
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

  _getRaiseSuggestion(BuildContext context,String productName,String productDescription) async {
    // networkStatus().then((isReachable) {
    // if (isReachable!) {

    startLoader();

    Webservice().raisedSuggestionService(productName: productName, productDescription: productDescription)
        .then((onResponse) async {
      stopLoader();
      if (kDebugMode) {
        print(onResponse!.message);
      }
      if (onResponse!.success = true) {
        await Future.delayed(const Duration(seconds: 2));
        Fluttertoast.showToast(msg: "Suggestion Added Successfully");
        setState(() {
          Navigator.pop(context);
        });

      } else {
        Fluttertoast.showToast(msg: "Failed to Add Suggestion");
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
