class VerifyOtp {
  String? refresh;
  String? access;
  String? msg;

  VerifyOtp({this.refresh, this.access, this.msg});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    data['msg'] = this.msg;
    return data;
  }
}