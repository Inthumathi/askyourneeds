class ServiceProductItem {
  bool? status;
  List<ServiceProductItemMessage>? message;
  int? totalProducts;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ServiceProductItem(
      {this.status,
      this.message,
      this.totalProducts,
      this.hasNextPage,
      this.hasPreviousPage});

  ServiceProductItem.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <ServiceProductItemMessage>[];
      json['message'].forEach((v) {
        message!.add(new ServiceProductItemMessage.fromJson(v));
      });
    }
    totalProducts = json['totalProducts'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['totalProducts'] = this.totalProducts;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    return data;
  }
}

class ServiceProductItemMessage {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  List<String>? bannerImg;
  String? description;
  String? hindiDescription;
  String? teluguDescription;
  String? serviceType;
  List<AvailableTime>? availableTime;
  // List<EmergencyTime> emergencyTime;
  int? serviceCharge;
  int? emergencyCharge;
  bool? isActive;
  int? iV;

  ServiceProductItemMessage(
      {this.sId,
      this.name,
      this.hindiName,
      this.teluguName,
      this.bannerImg,
      this.description,
      this.hindiDescription,
      this.teluguDescription,
      this.serviceType,
      this.availableTime,
      // this.emergencyTime,
      this.serviceCharge,
      this.emergencyCharge,
      this.isActive,
      this.iV});

  ServiceProductItemMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    bannerImg = json['bannerImg'].cast<String>();
    description = json['description'];
    hindiDescription = json['hindiDescription'];
    teluguDescription = json['teluguDescription'];
    serviceType = json['serviceType'];
    if (json['availableTime'] != null) {
      availableTime = <AvailableTime>[];
      json['availableTime'].forEach((v) {
        availableTime!.add(new AvailableTime.fromJson(v));
      });
    }
    // if (json['emergencyTime'] != null) {
    //   emergencyTime = new List<EmergencyTime>();
    //   json['emergencyTime'].forEach((v) {
    //     emergencyTime.add(new EmergencyTime.fromJson(v));
    //   });
    // }
    serviceCharge = json['serviceCharge'];
    emergencyCharge = json['emergencyCharge'];
    isActive = json['isActive'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['hindiName'] = this.hindiName;
    data['teluguName'] = this.teluguName;
    data['bannerImg'] = this.bannerImg;
    data['description'] = this.description;
    data['hindiDescription'] = this.hindiDescription;
    data['teluguDescription'] = this.teluguDescription;
    data['serviceType'] = this.serviceType;
    if (this.availableTime != null) {
      data['availableTime'] =
          this.availableTime!.map((v) => v.toJson()).toList();
    }
    // if (this.emergencyTime != null) {
    //   data['emergencyTime'] =
    //       this.emergencyTime.map((v) => v.toJson()).toList();
    // }
    data['serviceCharge'] = this.serviceCharge;
    data['emergencyCharge'] = this.emergencyCharge;
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    return data;
  }
}

class AvailableTime {
  String? startTime;
  String? closeTime;
  String? sId;

  AvailableTime({this.startTime, this.closeTime, this.sId});

  AvailableTime.fromJson(Map<String, dynamic> json) {
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
