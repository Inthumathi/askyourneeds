import 'dart:convert';
import 'package:askun_delivery_app/Models/Category/DailyNeeds.dart';
import 'package:askun_delivery_app/Models/Category/FoodAndBeverage.dart';
import 'package:askun_delivery_app/Models/Category/service.dart';
import 'package:askun_delivery_app/Models/advertisement/advertiesment.dart';
import 'package:askun_delivery_app/Models/login/login.dart';
import 'package:askun_delivery_app/Models/login/onboarding/onboarding.dart';
import 'package:askun_delivery_app/Models/login/otp/otpmodel.dart';
import 'package:askun_delivery_app/Models/login/otp/resendotp.dart';
import 'package:askun_delivery_app/Models/logout/logout.dart';
import 'package:askun_delivery_app/Models/product/dailyneedsproductItems.dart';
import 'package:askun_delivery_app/Models/product/foodandbeverageproductItems.dart';
import 'package:askun_delivery_app/Models/product/serviceproductitems.dart';
import 'package:askun_delivery_app/Models/subcateogries/dailyneeds_subCategories.dart';
import 'package:askun_delivery_app/Models/subcateogries/foodandbeverage.dart';
import 'package:askun_delivery_app/Models/subcateogries/service_subcategories.dart';
import 'package:askun_delivery_app/Models/userprofile/profile.dart';
import 'package:askun_delivery_app/utilites/api_constant.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';



String? accessToken = prefs!.getString('accesstoken');
String? refreshToken = prefs!.getString('refreshtoken');

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({required this.url, required this.parse});
}

class Webservice {
  static const storage = FlutterSecureStorage();

  // Login Service
  Future<LoginResponse?> callLoginService({required String phoneNumber}) async {
    final url = Uri.parse(ApiConstants.loginURL);
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = '{"number": $phoneNumber}';
    if (kDebugMode) {
      print('Response$body');
    }
    try {
      final response = await http
          .post(
            url,
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: 30));
      if (kDebugMode) {
        print(headers);
        print(body);
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return loginResponse;
      } else if (response.statusCode == 404) {
        throw Exception('User does not exist');
      } else if (response.statusCode == 500) {
        throw Exception(
            'OTP already sent recently, please wait before trying again');
      } else {
        throw Exception('Failed to login');
      }
    }
    // on TimeoutException {
    //   throw Exception('Request timed out');
    // }
    catch (e) {
      // Handle any other errors that might occur during the request
      throw Exception('Failed to login: $e');
    }
  }

  // Verify OTP Service
  Future<VerifyOtp?> callVerifyOtpService(
      { required String otpCode}) async {
    var url = Uri.parse(ApiConstants.verifyOTPUrl);
    if (kDebugMode) {
      print("URL: $url");
    }
    final headers = {
      'Content-Type': 'application/json',
    };
    Map<String, dynamic> data = {
      'token': prefs!.getString('message'),
      'otp': otpCode
    };
    var body = json.encode(data);
    try {
      final response = await http
          .post(
            url,
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print(headers);
        print(body);
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final verifyOtp = VerifyOtp.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return verifyOtp;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      // Handle any other errors that might occur during the request
      throw Exception(' $e');
    }
  }

  // Recent OTP Service
  Future<ResendOtpResponse> callRecentOtpService() async {
    var url = Uri.parse(ApiConstants.recentOTPUrl);
    if (kDebugMode) {
      print("URL: $url");
    }
    final headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> data = {
      'token':  prefs!.getString('message'),
    };
    var body = json.encode(data);
    try {
      final response = await http
          .post(
            url,
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print(headers);
        print(body);
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final recentOtp = ResendOtpResponse.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return recentOtp;
      } else if (response.statusCode == 404) {
        throw Exception('User does not exist');
      } else if (response.statusCode == 500) {
        throw Exception(
            'OTP already sent recently, please wait before trying again');
      } else {
        throw Exception('Failed to login');
      }
    }
    // on TimeoutException {
    //   throw Exception('Request timed out');
    // }
    catch (e) {
      // Handle any other errors that might occur during the request
      throw Exception('Failed to login: $e');
    }
  }

  // Logout Service
  Future<LogoutResponse> callLogoutService() async {
    var url = Uri.parse(ApiConstants.logoutUrl);
    if (kDebugMode) {
      print("URL: $url");
    }
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $refreshToken'
    };

    try {
      final response = await http
          .get(
            url,
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print(headers);
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final logout = LogoutResponse.fromJson(jsonResponse);
        return logout;
      } else {
        throw Exception('Logout Failed');
      }
    } catch (e) {
      throw Exception('Logout Failed $e');
    }
  }

  // OnBoarding Service
  Future<OnBoardingResponse?> callOnBoardingService(
      {required String pinCode}) async {
    final url = Uri.parse(ApiConstants.onBoardingURL);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    print('header$headers');
    Map<String, dynamic> data = {
      "pincode": pinCode
    };
    var body = json.encode(data);
    if (kDebugMode) {
      print('Response$body');
    }
    try {
      final response = await http
          .post(
            url,
            headers: headers,
            body: body,
          )
          .timeout(const Duration(seconds: 15));
      if (kDebugMode) {
        print(url);
        print(headers);
        print(body);
        print(response.statusCode);
      }

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final onBoardingResponse = OnBoardingResponse.fromJson(jsonResponse);
        return onBoardingResponse;
      } else if (response.statusCode == 404) {
        throw Exception('User does not exist');
      } else if (response.statusCode == 500) {
        throw Exception(
            'OTP already sent recently, please wait before trying again');
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  // UserProfile Service
  Future<UserProfileResponse> callProfileService(
      {required String accessToken}) async {
    var url = Uri.parse(
      ApiConstants.profileURL,
    );
    if (kDebugMode) {
      print(url);
    }
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    if (kDebugMode) {
      print(headers);
    }
    final response = await http
        .get(
      url,
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('Error', 500);
      },
    );
    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("profileListData", response.body.toString());
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserProfileResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // getHomeCarousel
  Future<BannerResponse> fetchBanners() async {
    var url = Uri.parse(ApiConstants.adsURL);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };

    final response = await http
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 10));
    if (kDebugMode) {
      print(response.statusCode);
      print(url);
      print(headers);
    }
    if (response.statusCode == 200) {
      return BannerResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch banners');
    }
  }

  // Daily need categories
  Future<DailyNeedResponse> fetchDailyNeeds() async {
    var url = Uri.parse(ApiConstants.dailyNeedsURL);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dailyNeedsResponse = DailyNeedResponse.fromJson(jsonData);

      return dailyNeedsResponse;
    } else {
      throw Exception('Failed to fetch daily needs');
    }
  }

  // Food and Beverage
  Future<FoodAndBeverageResponse> fetchFoodAndBeverage(
      ) async {
    var url = Uri.parse(ApiConstants.foodAndBeverageURL);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final foodAndBeverageResponse =
          FoodAndBeverageResponse.fromJson(jsonData);

      return foodAndBeverageResponse;
    } else {
      throw Exception('Failed to fetch daily needs');
    }
  }

  // Service
  Future<ServiceResponse> fetchService() async {
    var url = Uri.parse(ApiConstants.serviceURL);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final serviceResponse = ServiceResponse.fromJson(jsonData);

      return serviceResponse;
    } else {
      throw Exception('Failed to fetch daily needs');
    }
  }

  // Daily Needs subcategories

  Future<DailyNeedsSubCategoriesResponse> fetchDailyNeedsSubCategories(
      { required categoryId}) async {
    var url = Uri.parse(
        '${ApiConstants.dailyNeedsSubCategoryURL}$categoryId?page=$page&limit=$limit');
    print(url);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dailyNeedsSubCategoriesResponse =
          DailyNeedsSubCategoriesResponse.fromJson(jsonData);

      return dailyNeedsSubCategoriesResponse;
    } else {
      throw Exception('Failed to fetch daily needs');
    }
  }

  // Daily Need product
  Future<DailyNeedsProductsItemsResponse> fetchDailyNeedsItems(
      {required categoryItemId}) async {
    var url = Uri.parse(
        '${ApiConstants.dailyNeedsItemURL}$categoryItemId/products?page=$page&limit=$limit');
    print('Item Url:$url');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dailyNeedsSubCategoriesItemResponse =
          DailyNeedsProductsItemsResponse.fromJson(jsonData);

      return dailyNeedsSubCategoriesItemResponse;
    } else {
      throw Exception('Failed to fetch daily needs');
    }
  }

  // Food and Beverage

  Future<RestaurantMenuResponse> fetchFoodAndBeverageSubCategories(
      {required String accessToken, required foodCategoryId}) async {
    var url = Uri.parse(
        '${ApiConstants.foodAndBeverageSubCategoryURL}?page=$page&limit=$limit&restaurant=$foodCategoryId');
    print(url);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': accessToken
    };

    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(headers);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final restaurantMenuResponse =
      RestaurantMenuResponse.fromJson(jsonData);

      return restaurantMenuResponse;
    } else {
      throw Exception('Failed to fetch food and beverage');
    }
  } // Daily Needs subcategories
  // Food and Beverage
  Future<FoodAndBeverageProductItemsResponse> fetchFoodAndBeverageItems(
      { required categoryItemId}) async {
    var url = Uri.parse(
        '${ApiConstants.foodAndBeverageItemURL}/$categoryItemId/products?page=$page&limit=$limit');
    print('Item Url:$url');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final foodAndBeverageItemResponse =
      FoodAndBeverageProductItemsResponse.fromJson(jsonData);

      return foodAndBeverageItemResponse;
    } else {
      throw Exception('Failed to fetch Food and Beverage Item Product');
    }
  }

  //service

  Future<ServiceSubCategoriesResponse> serviceSubCategories(
      { required serviceCategoryId}) async {
    var url = Uri.parse('${ApiConstants.serviceSubCategoriesURL}?page=$page&limit=$limit&service=$serviceCategoryId');
    print(url);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };

    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(headers);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final serviceSubCategoriesResponse =
      ServiceSubCategoriesResponse.fromJson(jsonData);

      return serviceSubCategoriesResponse;
    } else {
      throw Exception('Failed to fetch food and beverage');
    }
  }

  Future<ServiceProductItem> fetchServiceItems(
      {required categoryItemId}) async {
    var url = Uri.parse(
        '${ApiConstants.serviceItemURL}/$categoryItemId/products?page=$page&limit=$limit');
    print('Item Url:$url');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $accessToken'
    };
    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(url);
      print(headers);
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final serviceItemResponse =
      ServiceProductItem.fromJson(jsonData);

      return serviceItemResponse;
    } else {
      throw Exception('Failed to fetch Food and Beverage Item Product');
    }
  }
}
