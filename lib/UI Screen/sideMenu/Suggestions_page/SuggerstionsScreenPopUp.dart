import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SuggestionsScreenPopUp extends StatefulWidget {
  const SuggestionsScreenPopUp({Key? key}) : super(key: key);

  @override
  State<SuggestionsScreenPopUp> createState() => _SuggestionsScreenPopUpState();
}

class _SuggestionsScreenPopUpState extends State<SuggestionsScreenPopUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,color: whiteColor),
          onPressed: () {
            // Add your back button logic here
          },
        ),
        title: SmallText(text: MyStrings.suggestion.tr(), fontFamily: MyStrings.aclonica,size: 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
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
                child: Center(child: SmallText(text: MyStrings.addASuggestion, color: whiteColor,fontFamily: MyStrings.poppins,)),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmallText(text: MyStrings.previousSuggestions.toUpperCase(),fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,size: 18,),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmallText(
                        text: MyStrings.suggestAProduct,
                        fontFamily: MyStrings.poppins,
                        size: 20,
                        color: secondPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      heightSpace,
                      heightSpace,
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: 1,
                        color: Colors.grey,
                      ),
                      heightSpace,
                      heightSpace,
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: MyStrings.enterProductName,
                                  fontWeight: FontWeight.w500,
                                  size: 20,
                                  fontFamily: MyStrings.poppins,
                                ),
                                heightSpace,
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 1.3,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(1),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                                heightSpace,
                                heightSpace,
                                SmallText(
                                  text: MyStrings.enterProductDescription,
                                  fontWeight: FontWeight.w500,
                                  size: 20,
                                  fontFamily: MyStrings.poppins,
                                ),
                                heightSpace,
                                Container(
                                  height: 85,
                                  width: MediaQuery.of(context).size.width / 1.3,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(1),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                                heightSpace,
                                heightSpace,
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your submit button logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 2, backgroundColor:primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      minimumSize: Size(300,5),

                                      padding: EdgeInsets.all(16),
                                    ),
                                    child: SmallText(text: MyStrings.submit,fontFamily: MyStrings.poppins,size: 18,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
