class UserProfileResponse {
  Message? message;
  bool? status;

  UserProfileResponse({this.message, this.status});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  int? number;
  int? tokenVersion;
  bool? isOnboardingCompleted;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? pincode;

  Message(
      {this.sId,
        this.number,
        this.tokenVersion,
        this.isOnboardingCompleted,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.pincode});

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    number = json['number'];
    tokenVersion = json['tokenVersion'];
    isOnboardingCompleted = json['isOnboardingCompleted'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['number'] = this.number;
    data['tokenVersion'] = this.tokenVersion;
    data['isOnboardingCompleted'] = this.isOnboardingCompleted;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['pincode'] = this.pincode;
    return data;
  }
}
