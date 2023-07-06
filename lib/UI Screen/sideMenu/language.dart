import 'package:askun_delivery_app/UI%20Screen/homepage/homepage.dart';
import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/loader.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
   Locale? selectedLocale; // Initialize the selected locale with the current locale.
  bool isLoading =false;
   @override
   void initState() {
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
       selectedLocale = EasyLocalization.of(context)!.locale;
     });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(
          text: MyStrings.changeLanguage.tr().toUpperCase(),
          fontFamily: MyStrings.aclonica,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Language selection container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Wrap(
                  children: languageList.map((Language language) {
                    return RadioListTile<Locale>(
                      activeColor: primaryColor,
                      title: SmallText(
                        text: language.langName.toUpperCase(),
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      value: language.locale,
                      groupValue: selectedLocale,
                      onChanged: (Locale? value) {
                        setState(() {
                          selectedLocale = value!;
                        });
                      },
                      contentPadding: EdgeInsets.zero,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Cancel and submit buttons container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle cancel button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: const Size(140.0, 44.0),
                      ),
                      child: SmallText(
                        text: MyStrings.cancel,
                        color: whiteColor,
                        fontFamily: MyStrings.aclonica,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: isLoading ? null : _setLocaleAndPop,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        minimumSize: const Size(140.0, 44.0),
                      ),
                      child: SmallText(
                        text: MyStrings.submit,
                        color: whiteColor,
                        fontFamily: MyStrings.aclonica,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   Future<void> _setLocaleAndPop() async {
     setState(() {
       isLoading = true;
     });

     await EasyLocalization.of(context)!.setLocale(selectedLocale!);
     await Future.delayed(const Duration(seconds: 2));

     setState(() {
       isLoading = false;
     });

     Navigator.pop(context);
   }

}
