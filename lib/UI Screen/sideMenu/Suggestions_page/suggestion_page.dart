import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:flutter/material.dart';


class Name {
  final String sensodyneTootpaste;
  final String added;
  final String addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus;
  final String notAdded;
  final String beefMeat;

  Name({
    required this.sensodyneTootpaste,
    required this.added,
    required this.addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus,
    required this.notAdded,
    required this.beefMeat,
  });
}


class SuggestionsScreen extends StatefulWidget {
  const SuggestionsScreen({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreen> createState() => _SuggestionsScreenState();
}

class _SuggestionsScreenState extends State<SuggestionsScreen> {
  List<Name> addressList = <Name>[
    Name(
      sensodyneTootpaste: 'Sensodyne 250gm Toothpaste ',
      added: 'Added',
      addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus: 'addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus',
      notAdded: 'not Added',
      beefMeat: 'beef Meat',
    ),
    // Add more items to the list as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: whiteColor),
          onPressed: () {
            // Add your back button logic here
          },
        ),
        title: SmallText(
          text: MyStrings.suggestion.toUpperCase(),
          fontFamily: MyStrings.aclonica,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondPrimaryColor,
                ),
                child: Center(
                  child: SmallText(
                    text: MyStrings.addASuggestion,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: MyStrings.poppins,
                    size: 18,
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(text: MyStrings.previousSuggestions.toUpperCase(),fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,size: 18,),
                ],
              ),
              heightSpace,
              heightSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  Name item = addressList[index];
                  return Container(
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightSpace,
                          heightSpace,
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: SmallText(text: item.sensodyneTootpaste, fontWeight: FontWeight.w600, fontFamily: MyStrings.poppins,)),
                                  widthSpace,
                                  SmallText(text: item.added, fontWeight: FontWeight.w600, fontFamily: MyStrings.poppins, size: 18), // Remove the colon here
                                ],
                              ),
                            ],
                          ),
                          heightSpace,
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 1,
                            color: Colors.grey,
                          ),
                          heightSpace,
                          SmallText(text: MyStrings.addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus,fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,),
                          heightSpace,
                        ],

                      ),
                    ),
                  );
                },
              ),
              heightSpace,
              heightSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  Name item = addressList[index];
                  return Container(
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightSpace,
                          heightSpace,
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: SmallText(text: item.sensodyneTootpaste, fontWeight: FontWeight.w600, fontFamily: MyStrings.poppins,)),
                                  widthSpace,
                                  SmallText(text: item.added, fontWeight: FontWeight.w600, fontFamily: MyStrings.poppins, size: 18), // Remove the colon here
                                ],
                              ),
                            ],
                          ),
                          heightSpace,
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 1,
                            color: Colors.grey,
                          ),
                          heightSpace,
                          SmallText(text: MyStrings.addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus,fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,),
                          heightSpace,
                        ],

                      ),
                    ),
                  );
                },
              ),
              heightSpace,
              heightSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  Name item = addressList[index];
                  return Container(
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heightSpace,
                          heightSpace,
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: SmallText(text: item.sensodyneTootpaste, fontWeight: FontWeight.w600, fontFamily: MyStrings.poppins,)),
                                  widthSpace,
                                  SmallText(text: item.added, fontWeight: FontWeight.w600, fontFamily: MyStrings.poppins, size: 18), // Remove the colon here
                                ],
                              ),
                            ],
                          ),
                          heightSpace,
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 1,
                            color: Colors.grey,
                          ),
                          heightSpace,
                          SmallText(text: MyStrings.addSensodyneTootPasteOfItProvidesSensitivityProtectionPlus,fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,),
                          heightSpace,
                        ],

                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
