class VerifyOtp {
  Message? message;
  bool? status;

  VerifyOtp({this.message, this.status});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Message {
  String? refreshtoken;
  String? accesstoken;
  bool? isOnboardingCompleted;

  Message({this.refreshtoken, this.accesstoken, this.isOnboardingCompleted});

  Message.fromJson(Map<String, dynamic> json) {
    refreshtoken = json['refreshtoken'];
    accesstoken = json['accesstoken'];
    isOnboardingCompleted = json['isOnboardingCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshtoken'] = this.refreshtoken;
    data['accesstoken'] = this.accesstoken;
    data['isOnboardingCompleted'] = this.isOnboardingCompleted;
    return data;
  }
}