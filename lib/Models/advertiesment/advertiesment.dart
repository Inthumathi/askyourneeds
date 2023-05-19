class AdvertisementResponse {
  List<Message>? message;
  bool? status;

  AdvertisementResponse({this.message, this.status});

  AdvertisementResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Message {
  String? sId;
  String? name;
  String? img;
  String? branch;
  String? redirect;
  String? startDate;
  String? endDate;
  int? iV;

  Message(
      {this.sId,
        this.name,
        this.img,
        this.branch,
        this.redirect,
        this.startDate,
        this.endDate,
        this.iV});

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    img = json['img'];
    branch = json['branch'];
    redirect = json['redirect'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['branch'] = this.branch;
    data['redirect'] = this.redirect;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['__v'] = this.iV;
    return data;
  }
}
