
import 'package:flutter/material.dart';

class UpdateProfileResponse {
  String? message;
  bool? status;
  Image? profilePic;

  UpdateProfileResponse({this.message, this.status, this.profilePic});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['profilePic'] = profilePic;
    return data;
  }
}
