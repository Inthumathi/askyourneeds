import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(
            text: MyStrings.support.tr().toUpperCase(),
            fontFamily: MyStrings.aclonica,
            color: whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SmallText(
                      text: MyStrings.contactUs.tr().toUpperCase(),
                      color: secondPrimaryColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontFamily: MyStrings.poppins,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.phone_android_sharp, color: whiteColor),
                        ),
                      ),
                      TextButton(
                          onPressed:() => launch("tel://+91-9398159868"),
                          child: SmallText(text: '+91-9398159868',color: blackColor,fontFamily: MyStrings.poppins,))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:Image(
                            image: AssetImage(
                              'assets/sideMenu/whatsapp.png',
                            ),
                            width: 20,
                          )
                        ),
                      ),
                      TextButton(
                          onPressed:()async {
                            String phoneNumber =
                                '+91-9398159868'; // Replace with the desired phone number
                            String message =
                                'Hello,'; // Replace with the desired message

                            // Construct the WhatsApp URL
                            String url =
                                'https://wa.me/$phoneNumber/?text=${Uri.encodeComponent(message)}';

                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch WhatsApp';
                            }
                          },
                          child: SmallText(text: '+91-9398159868',color: blackColor,fontFamily: MyStrings.poppins,))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.phone_android_sharp, color: whiteColor),
                        ),
                      ),
                      TextButton(
                          onPressed:()async {
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'support@askyourneeds.com',
                            );
                            if (await canLaunch(emailUri.toString())) {
                              await launch(emailUri.toString());
                            } else {
                              // Handle error: unable to launch the email application
                            }
                          },
                          child: SmallText(text: 'support@askyourneeds.com',color: blackColor,fontFamily: MyStrings.poppins,))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SmallText(text: 'Note:',size: 15,fontFamily: MyStrings.poppins,fontWeight: FontWeight.w500,),
                  SmallText(text: 'Our support team is available from 08:00 AM - 10:00 PM, For any quires or complaints contact with our support team.',size: 14,fontFamily: MyStrings.poppins,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
