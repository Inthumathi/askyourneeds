import 'package:askun_delivery_app/utilities/constant.dart';
import 'package:askun_delivery_app/utilities/strings.dart';
import 'package:askun_delivery_app/widget/smallText.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgMainColor,
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(
            text: MyStrings.privacyPolicy.toUpperCase().tr(),
            fontFamily: MyStrings.aclonica),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Text(
                'This privacy policy (Privacy Policy) describes the policies and procedures applicable to the collection, use, disclosure and protection of Your information shared with Us while You use the Platform, and for the purpose of this Privacy Policy "We", "Us", or "Our" refers to Squbesoftsol Pvt. Ltd., wherever context so require and the terms “You”, “Your”, “Yourself” or “User” refer to user of the Platform. We value the trust You place in Us. That is why,We maintain reasonable security standards for securing the transactions andYour information. This Privacy Policy is an electronic record under the Information Technology Act, 2000 and the rules made thereunder. This Privacy Policy does not require any physical, electronic, or digital signature by Us and has been published in accordance with the provisions of the Information Technology Act, 2000 and the rules made thereunder that require publishing the privacy policy and terms of use on thePlatform. Please read the Privacy Policy carefully prior to using or registering on the Platform or accessing any material, information or availing any Services through the Platform. This Privacy Policy specifies the manner in which Your information is collected, received, stored, processed, disclosed, transferred, dealt with or otherwise handled by Us. This Privacy Policy does not apply to information that You provide to, or that is collected by, any third-party through the Platform, and any Third-Party Sites that You access or use in connection with the Services offered on the Platform. By visiting the Platform or setting up/creating an user account (Account) on the Platform, You accept and agree to be bound by the terms and conditions of this Privacy Policy and consent to Us collecting, storing, processing, transferring and sharing information includingYour Personal Information (defined below)in accordance with this Privacy Policy. Further, in case You are under the age of 18 years, You (i) accept and acknowledge that You are accessing the Platform through a parent or a legal guardian who is of a legal age to form a binding contract under the Indian Contract Act, 1872 and such person has accepted this Privacy Policy on Your behalf to bind You; and (ii) hereby acknowledge that You are accessing this Platform under the supervision of Your parent or legal guardian and have their express permission to use the Services. We may update this Privacy Policy in order to comply with the regulatory or administrative requirements. If We make any significant changes to this Privacy Policy, We will endeavour to provide You with reasonable notice of such changes, such as via prominent notice on the Platform or any other communication channels on record. To the extent permitted under applicable law, Your continued use of the Services after We publish or send a notice about the changes to this Privacy Policy shall constitute Your consent to the updated Privacy Policy.',
        textAlign: TextAlign.justify,
          style: TextStyle(
          fontFamily: MyStrings.aclonica,fontWeight: FontWeight.normal,
           height: 1.8
        ),
        ),
      ),
    );
  }
}
