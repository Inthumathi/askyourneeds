
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CategoriesViewAll{
  dailyNeeds,
  foodBeverages,
  service
}

var heightSpace = const SizedBox(height: 10,);
var widthSpace = const SizedBox(width: 10,);

int timeDuration = 30;
int page = 1;
int limit = 20;

SharedPreferences? prefs;


// Color
Color whiteColor = Colors.white;
Color primaryColor =  const Color(0xff33056F);
Color secondPrimaryColor =  const Color(0xffFF9431);
Color circleColor =  const Color(0xffffceb5);
Color containerColor =  const Color(0xffffecbb);
Color blueGrey = Colors.blueGrey;
Color containerLightColor = const Color(0xffffe6da);
Color blackColor = Colors.black;
Color seeColor = const Color(0xff007474);
Color addressHeadingTextColor = const Color(0xffa4a0a4);
Color iconColor = const Color(0xff575757);
Color addressBorderColor = const Color(0xfff5f0f5);
Color scaffoldBgColor = const Color(0xfff2eff8);
Color appBarColor = const Color(0xfffafafa);
Color circleShapeColor = const  Color(0xffffd6c2);
Color bgColor = const  Color(0xffE3E3E3);
Color locationContainerColor = const  Color(0xffD9D9D9);
Color sideMenuColor = const  Color(0xffF37130);
Color searchColor = const  Color(0xffF5F5F8);
Color scaffoldBgMainColor = const  Color(0xffE7D6FD);
Color offerColor = const  Color(0xffFA4A0C);
Color starColor = const  Color(0xffF2CF63);
Color backGroundColor = const Color(0xffF5F5F5);
Color textGreyColor = const Color(0xff808080);
Color dividerColor = const Color(0xffB3B3B3);
Color successColor = const Color(0xff2A794A);
Color deliverySuccessColor = const Color(0xff1A7423);
Color deliveryFailureColor = const Color(0xffB94329);
Color failureColor = const Color(0xff9D1414);
Color orderHistoryBGColor = const Color(0xffF2F2F2);
Color addressContainerColor = const Color(0xffE8E7E7);
Color selectMap = const Color(0xff5F93E0);
Color addressTextColor = const Color(0xffA296B1);


