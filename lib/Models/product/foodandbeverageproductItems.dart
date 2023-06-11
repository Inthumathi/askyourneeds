class FoodAndBeverageProductItemsResponse {
  bool? status;
  List<FoodAndBeverageItemMessage>? message;
  int? totalProducts;
  bool? hasNextPage;
  bool? hasPreviousPage;

  FoodAndBeverageProductItemsResponse(
      {this.status,
      this.message,
      this.totalProducts,
      this.hasNextPage,
      this.hasPreviousPage});

  FoodAndBeverageProductItemsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <FoodAndBeverageItemMessage>[];
      json['message'].forEach((v) {
        message!.add(new FoodAndBeverageItemMessage.fromJson(v));
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

class FoodAndBeverageItemMessage {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? img;
  String? type;
  String? variants;
  String? availableStocks;
  String? availableStockUnit;
  String? tax;
  String? restaurantMenu;
  String? label;
  String? hindiLabel;
  String? teluguLabel;
  String? description;
  String? hindiDescription;
  String? teluguDescription;
  bool? isActive;
  String? productSize;
  String? productUnit;
  String? priceType;
  String? productPrice;
  String? discountValue;
  String? discountType;
  int? iV;

  FoodAndBeverageItemMessage(
      {this.sId,
      this.name,
      this.hindiName,
      this.teluguName,
      this.img,
      this.type,
      this.variants,
      this.availableStocks,
      this.availableStockUnit,
      this.tax,
      this.restaurantMenu,
      this.label,
      this.hindiLabel,
      this.teluguLabel,
      this.description,
      this.hindiDescription,
      this.teluguDescription,
      this.isActive,
      this.productSize,
      this.productUnit,
      this.priceType,
      this.productPrice,
      this.discountValue,
      this.discountType,
      this.iV});

  FoodAndBeverageItemMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    img = json['img'];
    type = json['type'];
    variants = json['variants'];
    availableStocks = json['availableStocks'];
    availableStockUnit = json['availableStockUnit'];
    tax = json['tax'];
    restaurantMenu = json['restaurantMenu'];
    label = json['label'];
    hindiLabel = json['hindiLabel'];
    teluguLabel = json['teluguLabel'];
    description = json['description'];
    hindiDescription = json['hindiDescription'];
    teluguDescription = json['TeluguDescription'];
    isActive = json['isActive'];
    productSize = json['productSize'];
    productUnit = json['productUnit'];
    priceType = json['priceType'];
    productPrice = json['productPrice'];
    discountValue = json['discountValue'];
    discountType = json['discountType'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['hindiName'] = this.hindiName;
    data['teluguName'] = this.teluguName;
    data['img'] = this.img;
    data['type'] = this.type;
    data['variants'] = this.variants;
    data['availableStocks'] = this.availableStocks;
    data['availableStockUnit'] = this.availableStockUnit;
    data['tax'] = this.tax;
    data['restaurantMenu'] = this.restaurantMenu;
    data['label'] = this.label;
    data['hindiLabel'] = this.hindiLabel;
    data['teluguLabel'] = this.teluguLabel;
    data['description'] = this.description;
    data['hindiDescription'] = this.hindiDescription;
    data['TeluguDescription'] = this.teluguDescription;
    data['isActive'] = this.isActive;
    data['productSize'] = this.productSize;
    data['productUnit'] = this.productUnit;
    data['priceType'] = this.priceType;
    data['productPrice'] = this.productPrice;
    data['discountValue'] = this.discountValue;
    data['discountType'] = this.discountType;
    data['__v'] = this.iV;
    return data;
  }
}
