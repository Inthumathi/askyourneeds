class ServiceResponse {
  bool? status;
  List<ServiceMessage>? message;
  int? totalServices;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ServiceResponse(
      {this.status,
        this.message,
        this.totalServices,
        this.hasNextPage,
        this.hasPreviousPage});

  ServiceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <ServiceMessage>[];
      json['message'].forEach((v) {
        message!.add(new ServiceMessage.fromJson(v));
      });
    }
    totalServices = json['totalServices'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['totalServices'] = this.totalServices;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    return data;
  }
}

class ServiceMessage {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? bannerImg;
  String? branch;
  bool? isActive;
  int? iV;

  ServiceMessage(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.bannerImg,
        this.branch,
        this.isActive,
        this.iV});

  ServiceMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    bannerImg = json['bannerImg'];
    branch = json['branch'];
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
    data['branch'] = this.branch;
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    return data;
  }
}
