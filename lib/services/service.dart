import 'dart:convert';
import 'package:askun_delivery_app/Models/Category/DailyNeeds.dart';
import 'package:askun_delivery_app/Models/Category/categoryResponse.dart';
import 'package:askun_delivery_app/Models/login/login.dart';
import 'package:askun_delivery_app/Models/login/onboarding/onboarding.dart';
import 'package:askun_delivery_app/Models/login/otp/otpmodel.dart';
import 'package:askun_delivery_app/Models/login/otp/resendotp.dart';
import 'package:askun_delivery_app/Models/logout/logout.dart';
import 'package:askun_delivery_app/utilites/api_constant.dart';
import 'package:askun_delivery_app/utilites/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({required this.url, required this.parse});
}

class Webservice {

  static final storage = FlutterSecureStorage();

// Login Service
//   Future<LoginResponse?> callLoginService({required String phoneNumber}) async {
//     var url = Uri.parse(ApiConstants.loginURL);
//     print("URL: $url");
//     Map<String, String> headers = {
//       'Content-type': 'application/json',
//       'Accept': '*/*',
//     };
//     Map<String, dynamic> data = {
//       'number': phoneNumber,
//     };
//     //encode Map to JSON
//     var body = json.encode(data);
//     print("Request body: $body");
//
//     final response = await http.post(url, headers: headers, body: body).timeout(
//       Duration(seconds: timeDuration),
//       onTimeout: () {
//         // Time has run out, do what you wanted to do.
//         return http.Response('Error', 400);
//       },
//     );
//     print("Response status code: ${response.statusCode}");
//     print("Response body: ${response.body}");
//
//
//     if (response.statusCode == 200) {
//      // Save phone number locally
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('loginResponse', phoneNumber);
//       // SharedPreferences prefs = await SharedPreferences.getInstance();
//       // prefs.setString("loginResponse",response.body.toString());
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       Map<String, dynamic> jsonResponse = json.decode(response.body);
//       // if (jsonResponse['message'] == 'OTP has been sent to your phone number') {
//         return LoginResponse.fromJson(jsonResponse);
//       // }
//       // else if (jsonResponse['message'] == 'New User registered, OTP sent to your Mobile Number') {
//       //   return LoginResponse.fromJson(jsonResponse);
//       // }
//
//       // else {
//       //   throw Exception(jsonResponse['message']);
//       // }
//     }
//
//     else if (response.statusCode == 404) {
//       throw Exception('User does not exist');
//     }else if (response.statusCode == 500) {
//       throw Exception('OTP already sent recently, please wait for some time before trying again');
//     }
//     else {
//       throw Exception('Failed to login');
//     }
//   }

  // Verify OTP Service

  Future<LoginResponse?> callLoginService({required String phoneNumber}) async {
    final url = Uri.parse(ApiConstants.loginURL);
    final headers = {
      'Content-Type': 'application/json',
    };
    // final body = jsonEncode({'number': phoneNumber});
    final body = '{"number": $phoneNumber}';
    print('Response$body');
    try {
      final response = await http.post(url, headers: headers, body: body,).timeout(Duration(seconds: 15));
      print(url);
      print(headers);
      print(body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final loginResponse = LoginResponse.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return loginResponse;
      } else if (response.statusCode == 404) {
        throw Exception('User does not exist');
      } else if (response.statusCode == 500) {
        throw Exception('OTP already sent recently, please wait before trying again');
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

  Future<VerifyOtp?> callVerifyOtpService({required String token,required String otpCode }) async {
    var url = Uri.parse(ApiConstants.verifyOTPUrl);
    print("URL: $url");
    final headers = {
      'Content-Type': 'application/json',
    };
    // final body = jsonEncode({'number': phoneNumber});
    // final body = 'phone_number': phoneNumber,;
    Map<String, dynamic> data = {
      'token': token,
      'otp': otpCode
    };
    var body = json.encode(data);
    print('Response$body');
    try {
      final response = await http.post(url, headers: headers, body: body,).timeout(Duration(seconds: 10));
      print(url);
      print(headers);
      print(body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final verifyOtp = VerifyOtp.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return verifyOtp;
      }  else {
        throw Exception('Failed to login');
      }
    }
    // on TimeoutException {
    //   throw Exception('Request timed out');
    // }
    catch (e) {
      // Handle any other errors that might occur during the request
      throw Exception(' $e');
    }
  }


  Future<ResendOtpResponse> callRecentOtpService({required String token}) async {
    var url = Uri.parse(ApiConstants.recentOTPUrl);
    print("URL: $url");
    final headers = {
      'Content-Type': 'application/json',
    };
    // final body = jsonEncode({'number': phoneNumber});
    // final body = 'phone_number': phoneNumber,;
    Map<String, dynamic> data = {
      'token': token,
    };
    var body = json.encode(data);
    print('Response$body');
    try {
      final response = await http.post(url, headers: headers, body: body,).timeout(Duration(seconds: 10));
      print(url);
      print(headers);
      print(body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final recentOtp = ResendOtpResponse.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return recentOtp;
      } else if (response.statusCode == 404) {
        throw Exception('User does not exist');
      } else if (response.statusCode == 500) {
        throw Exception('OTP already sent recently, please wait before trying again');
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

  Future<LogoutResponse> callLogoutService({required String refreshToken}) async {
    var url = Uri.parse(ApiConstants.logoutUrl);
    print("URL: $url");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'JWT $refreshToken'
    };
    // final body = jsonEncode({'number': phoneNumber});
    // final body = 'phone_number': phoneNumber,;

    try {
      final response = await http.get(url, headers: headers,).timeout(Duration(seconds: 10));
      print(headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final logout = LogoutResponse.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return logout;
      } else {
        throw Exception('Logout Failed');
      }
    }

    catch (e) {
      // Handle any other errors that might occur during the request
      throw Exception('Logout Failed $e');
    }
  }

  Future<List<DailyNeedsCategory>> callDailyNeedsService() async {
    var url = Uri.parse(ApiConstants.dailyNeedsURL);
    final response = await http.get(url).timeout(
      Duration(seconds: timeDuration),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response('Error', 400);
      },
    );


    if (response.statusCode == 200) {
      // final List<dynamic> dailyNeedsResultList = json.decode(result);
      // print('Test Result: $dailyNeedsResultList');
      final jsonList = json.decode(response.body) as List;
      return jsonList.map((e) => DailyNeedsCategory.fromJson(e)).toList();

    } else {
      throw Exception('Failed to load Daily Needs Categories');
    }

  }


  Future<OnBoardingResponse?> callOnBoardingService({required String accessToken,required String pinCode}) async {
    final url = Uri.parse(ApiConstants.onBoardingURL);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':'JWT $accessToken'
    };
    // final body = jsonEncode({'number': phoneNumber});
    const body = '{"pincode": "131402"}';
    print('Response$body');
    try {
      final response = await http.post(url, headers: headers, body: body,).timeout(Duration(seconds: 15));
      print(url);
      print(headers);
      print(body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final onBoardingResponse = OnBoardingResponse.fromJson(jsonResponse);
        // Save login response or access token to local storage if necessary
        return onBoardingResponse;
      } else if (response.statusCode == 404) {
        throw Exception('User does not exist');
      } else if (response.statusCode == 500) {
        throw Exception('OTP already sent recently, please wait before trying again');
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



  Future<dynamic> getCategory({required String accessToken}) async {

    Map<String, String> headers = {
      'Authorization':'Jwt $accessToken'
    };
    print(accessToken);
    var url = Uri.parse(ApiConstants.categoryURL);
    print(url);
    final response = await http.get(url,headers:headers);
    final result = response.body; // Use the response body directly
    print(result);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> categoryResultList = json.decode(result);
      final List<CategoryResponse> categoryList = categoryResultList.map((categoryJson) => CategoryResponse.fromJson(categoryJson)).toList();
      return categoryList;
    }
    else {
      throw Exception('Error');
    }
  }


}
