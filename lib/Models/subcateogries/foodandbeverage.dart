class RestaurantMenuResponse {
  bool? status;
  List<FoodAndBeverageMessage>? message;
  int? totalMenuRestaurant;
  bool? hasNextPage;
  bool? hasPreviousPage;

  RestaurantMenuResponse(
      {this.status,
        this.message,
        this.totalMenuRestaurant,
        this.hasNextPage,
        this.hasPreviousPage});

  RestaurantMenuResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <FoodAndBeverageMessage>[];
      json['message'].forEach((v) {
        message!.add(new FoodAndBeverageMessage.fromJson(v));
      });
    }
    totalMenuRestaurant = json['totalMenuRestaurant'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    data['totalMenuRestaurant'] = this.totalMenuRestaurant;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    return data;
  }
}

class FoodAndBeverageMessage {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? bannerImg;
  String? restaurant;
  bool? isActive;
  int? iV;

  FoodAndBeverageMessage(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.bannerImg,
        this.restaurant,
        this.isActive,
        this.iV});

  FoodAndBeverageMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    bannerImg = json['bannerImg'];
    restaurant = json['restaurant'];
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
    data['restaurant'] = this.restaurant;
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    return data;
  }
}
