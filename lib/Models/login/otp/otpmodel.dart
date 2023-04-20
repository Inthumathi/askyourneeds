class VerifyOtp {
  Message? message;
  bool? status;

  VerifyOtp({this.message, this.status});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Message {
  String? refreshtoken;
  String? accesstoken;

  Message({this.refreshtoken, this.accesstoken});

  Message.fromJson(Map<String, dynamic> json) {
    refreshtoken = json['refreshtoken'];
    accesstoken = json['accesstoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshtoken'] = this.refreshtoken;
    data['accesstoken'] = this.accesstoken;
    return data;
  }
}