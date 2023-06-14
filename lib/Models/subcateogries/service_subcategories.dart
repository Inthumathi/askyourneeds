class ServiceSubCategoriesResponse {
  bool? status;
  List<ServiceSubCategoriesMessage>? message;
  int? totalServiceTypes;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ServiceSubCategoriesResponse(
      {this.status,
        this.message,
        this.totalServiceTypes,
        this.hasNextPage,
        this.hasPreviousPage});

  ServiceSubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <ServiceSubCategoriesMessage>[];
      json['message'].forEach((v) {
        message!.add(new ServiceSubCategoriesMessage.fromJson(v));
      });
    }
    totalServiceTypes = json['totalServiceTypes'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['totalServiceTypes'] = this.totalServiceTypes;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    return data;
  }
}

class ServiceSubCategoriesMessage {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? bannerImg;
  String? service;
  bool? isActive;
  int? iV;

  ServiceSubCategoriesMessage(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.bannerImg,
        this.service,
        this.isActive,
        this.iV});

  ServiceSubCategoriesMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    bannerImg = json['bannerImg'];
    service = json['service'];
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
    data['service'] = this.service;
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    return data;
  }
}
