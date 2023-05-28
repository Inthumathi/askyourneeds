
import 'package:askun_delivery_app/utilites/constant.dart';

class ApiConstants {
  static const String baseUrl = 'https://anyapp.squbesoftsol.com';
  static const String api = '$baseUrl/api';
  static const String authUrl = '$api/auth';
  static const String verifyOTPUrl = '$authUrl/verify-otp';
  static const String recentOTPUrl = '$authUrl/resend-otp';
  static const String logoutUrl = '$authUrl/logout';
  static const String loginURL = '$authUrl/login';
  static const String categoryURL = '$authUrl/category?isShownToHomepage=true';
  static const String onBoardingURL = '$api/user/onboarding';
  static const String profileURL = '$api/user';
  static const String adsURL = '$api/advertisment';
  static  String dailyNeedsURL = '$api/dailyneeds?page=$page&limit=$limit';
  static  String serviceURL = '$api/service?page=$page&limit=$limit';
  static  String foodAndBeverageURL = '$api/restaurant?page=$page&limit=$limit';


  // Image URL
  static const String imageBaseURL = 'https://anyapi.squbesoftsol.com/images';
  static const String bannerImageURL = '$imageBaseURL/advertisment/';
  static const String dailyNeedsImageBaseURL = '$imageBaseURL/dailyneeds/';
  static const String serviceImageURL = '$imageBaseURL/service/';
  static const String restaurantImageURL = '$imageBaseURL/restaurant/';

}