import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:askun_delivery_app/utilites/strings.dart';
import 'package:askun_delivery_app/widget/smalltext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: SmallText(text: MyStrings.profile.tr()),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(text: MyStrings.personalDetails.tr(),size: 16,fontWeight: FontWeight.w500,),
                TextButton(
                    onPressed: (){},
                    child: SmallText(text:MyStrings.edit.tr(),size: 16,fontWeight: FontWeight.w500,color: offerColor,)),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
