class DailyNeedResponse {
  bool? status;
  List<MessageDailyNeeds>? message;
  int? totalDailyNeeds;
  bool? hasNextPage;
  bool? hasPreviousPage;

  DailyNeedResponse(
      {this.status,
        this.message,
        this.totalDailyNeeds,
        this.hasNextPage,
        this.hasPreviousPage});

  DailyNeedResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <MessageDailyNeeds>[];
      json['message'].forEach((v) {
        message!.add(new MessageDailyNeeds.fromJson(v));
      });
    }
    totalDailyNeeds = json['totalDailyNeeds'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['totalDailyNeeds'] = this.totalDailyNeeds;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    return data;
  }
}

class MessageDailyNeeds {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? bannerImg;
  Location? location;
  String? deliveryTime;
  List<OpenTime>? openTime;
  bool? isActive;
  int? iV;
  bool? isChildren;

  MessageDailyNeeds(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.bannerImg,
        this.location,
        this.deliveryTime,
        this.openTime,
        this.isActive,
        this.iV,
        this.isChildren});

  MessageDailyNeeds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    bannerImg = json['bannerImg'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    deliveryTime = json['deliveryTime'];
    if (json['openTime'] != null) {
      openTime = <OpenTime>[];
      json['openTime'].forEach((v) {
        openTime!.add(new OpenTime.fromJson(v));
      });
    }
    isActive = json['isActive'];
    iV = json['__v'];
    isChildren = json['isChildren'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['hindiName'] = this.hindiName;
    data['teluguName'] = this.teluguName;
    data['bannerImg'] = this.bannerImg;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['deliveryTime'] = this.deliveryTime;
    if (this.openTime != null) {
      data['openTime'] = this.openTime!.map((v) => v.toJson()).toList();
    }
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    data['isChildren'] = this.isChildren;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;
  String? sId;

  Location({this.type, this.coordinates, this.sId});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    return data;
  }
}

class OpenTime {
  String? startTime;
  String? closeTime;
  String? sId;

  OpenTime({this.startTime, this.closeTime, this.sId});

  OpenTime.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    closeTime = json['closeTime'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['closeTime'] = this.closeTime;
    data['_id'] = this.sId;
    return data;
  }
}
