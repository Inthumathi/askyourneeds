class DailyNeedsProductsItemsResponse {
  bool? status;
  List<DailyNeedsProductMessage>? message;
  int? totalProducts;
  bool? hasNextPage;
  bool? hasPreviousPage;

  DailyNeedsProductsItemsResponse(
      {this.status,
        this.message,
        this.totalProducts,
        this.hasNextPage,
        this.hasPreviousPage});

  DailyNeedsProductsItemsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <DailyNeedsProductMessage>[];
      json['message'].forEach((v) {
        message!.add(new DailyNeedsProductMessage.fromJson(v));
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

class DailyNeedsProductMessage {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? img;
  String? type;
  String? variants;
  String? availableStocks;
  String? tax;
  String? dailyNeed;
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
  String? extraCharge;
  String? discountValue;
  String? discountType;
  int? iV;
  String? availableStockUnit;

  DailyNeedsProductMessage(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.img,
        this.type,
        this.variants,
        this.availableStocks,
        this.tax,
        this.dailyNeed,
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
        this.extraCharge,
        this.discountValue,
        this.discountType,
        this.iV,
        this.availableStockUnit});

  DailyNeedsProductMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    img = json['img'];
    type = json['type'];
    variants = json['variants'];
    availableStocks = json['availableStocks'];
    tax = json['tax'];
    dailyNeed = json['dailyNeed'];
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
    extraCharge = json['extraCharge'];
    discountValue = json['discountValue'];
    discountType = json['discountType'];
    iV = json['__v'];
    availableStockUnit = json['availableStockUnit'];
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
    data['tax'] = this.tax;
    data['dailyNeed'] = this.dailyNeed;
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
    data['extraCharge'] = this.extraCharge;
    data['discountValue'] = this.discountValue;
    data['discountType'] = this.discountType;
    data['__v'] = this.iV;
    data['availableStockUnit'] = this.availableStockUnit;
    return data;
  }
}
