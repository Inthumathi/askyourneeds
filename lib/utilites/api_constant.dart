
class ApiConstants {
  static const String baseUrl = 'https://anyapp.squbesoftsol.com/api';
  static const String authUrl = '$baseUrl/auth';
  static const String registerURL = '${baseUrl}signup/';
  static const String verifyOTPUrl = '$authUrl/verify-otp';
  static const String recentOTPUrl = '$authUrl/resend-otp';
  static const String logoutUrl = '$authUrl/logout';
  static const String loginURL = '$authUrl/login';
  static const String categoryURL = '$authUrl/category?isShownToHomepage=true';
  static const String dailyNeedsURL = '${baseUrl}categories/';
  static const String onBoardingURL = '$baseUrl/user/onboarding';
  static const String profileURL = '$baseUrl/user';
  static const String adsURL = '$baseUrl/advertisment';
}