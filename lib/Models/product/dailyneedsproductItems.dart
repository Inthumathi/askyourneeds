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
        message!.add(DailyNeedsProductMessage.fromJson(v));
      });
    }
    totalProducts = json['totalProducts'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    data['totalProducts'] = totalProducts;
    data['hasNextPage'] = hasNextPage;
    data['hasPreviousPage'] = hasPreviousPage;
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
  AvailableStockUnit? availableStockUnit;
  Tax? tax;
  DailyNeed? dailyNeed;
  String? label;
  String? hindiLabel;
  String? teluguLabel;
  String? description;
  String? hindiDescription;
  String? teluguDescription;
  bool? isActive;
  List<ProductPriceInfo>? productPriceInfo;
  String? priceType;
  String? discountValue;
  String? discountType;
  int? iV;

  DailyNeedsProductMessage(
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
        this.dailyNeed,
        this.label,
        this.hindiLabel,
        this.teluguLabel,
        this.description,
        this.hindiDescription,
        this.teluguDescription,
        this.isActive,
        this.productPriceInfo,
        this.priceType,
        this.discountValue,
        this.discountType,
        this.iV});

  DailyNeedsProductMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    img = json['img'];
    type = json['type'];
    variants = json['variants'];
    availableStocks = json['availableStocks'];
    availableStockUnit = json['availableStockUnit'] != null
        ? AvailableStockUnit.fromJson(json['availableStockUnit'])
        : null;
    tax = json['tax'] != null ? Tax.fromJson(json['tax']) : null;
    dailyNeed = json['dailyNeed'] != null
        ? DailyNeed.fromJson(json['dailyNeed'])
        : null;
    label = json['label'];
    hindiLabel = json['hindiLabel'];
    teluguLabel = json['teluguLabel'];
    description = json['description'];
    hindiDescription = json['hindiDescription'];
    teluguDescription = json['TeluguDescription'];
    isActive = json['isActive'];
    if (json['productPriceInfo'] != null) {
      productPriceInfo = <ProductPriceInfo>[];
      json['productPriceInfo'].forEach((v) {
        productPriceInfo!.add(ProductPriceInfo.fromJson(v));
      });
    }
    priceType = json['priceType'];
    discountValue = json['discountValue'];
    discountType = json['discountType'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['hindiName'] = hindiName;
    data['teluguName'] = teluguName;
    data['img'] = img;
    data['type'] = type;
    data['variants'] = variants;
    data['availableStocks'] = availableStocks;
    if (availableStockUnit != null) {
      data['availableStockUnit'] = availableStockUnit!.toJson();
    }
    if (tax != null) {
      data['tax'] = tax!.toJson();
    }
    if (dailyNeed != null) {
      data['dailyNeed'] = dailyNeed!.toJson();
    }
    data['label'] = label;
    data['hindiLabel'] = hindiLabel;
    data['teluguLabel'] = teluguLabel;
    data['description'] = description;
    data['hindiDescription'] = hindiDescription;
    data['TeluguDescription'] = teluguDescription;
    data['isActive'] = isActive;
    if (productPriceInfo != null) {
      data['productPriceInfo'] =
          productPriceInfo!.map((v) => v.toJson()).toList();
    }
    data['priceType'] = priceType;
    data['discountValue'] = discountValue;
    data['discountType'] = discountType;
    data['__v'] = iV;
    return data;
  }
}

class AvailableStockUnit {
  String? sId;
  String? volume;
  String? unitValue;
  bool? status;
  String? variant;
  int? iV;

  AvailableStockUnit(
      {this.sId,
        this.volume,
        this.unitValue,
        this.status,
        this.variant,
        this.iV});

  AvailableStockUnit.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    volume = json['volume'];
    unitValue = json['unitValue'];
    status = json['status'];
    variant = json['variant'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['volume'] = volume;
    data['unitValue'] = unitValue;
    data['status'] = status;
    data['variant'] = variant;
    data['__v'] = iV;
    return data;
  }
}

class Tax {
  String? sId;
  String? name;
  String? percentage;
  bool? status;
  int? iV;

  Tax({this.sId, this.name, this.percentage, this.status, this.iV});

  Tax.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    percentage = json['percentage'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['percentage'] = percentage;
    data['status'] = status;
    data['__v'] = iV;
    return data;
  }
}

class DailyNeed {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? bannerImg;
  Location? location;
  String? deliveryTime;
  List<OpenTime>? openTime;
  bool? isActive;
  bool? isChildren;
  int? iV;

  DailyNeed(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.bannerImg,
        this.location,
        this.deliveryTime,
        this.openTime,
        this.isActive,
        this.isChildren,
        this.iV});

  DailyNeed.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    bannerImg = json['bannerImg'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    deliveryTime = json['deliveryTime'];
    if (json['openTime'] != null) {
      openTime = <OpenTime>[];
      json['openTime'].forEach((v) {
        openTime!.add(OpenTime.fromJson(v));
      });
    }
    isActive = json['isActive'];
    isChildren = json['isChildren'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['hindiName'] = hindiName;
    data['teluguName'] = teluguName;
    data['bannerImg'] = bannerImg;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['deliveryTime'] = deliveryTime;
    if (openTime != null) {
      data['openTime'] = openTime!.map((v) => v.toJson()).toList();
    }
    data['isActive'] = isActive;
    data['isChildren'] = isChildren;
    data['__v'] = iV;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    data['_id'] = sId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startTime'] = startTime;
    data['closeTime'] = closeTime;
    data['_id'] = sId;
    return data;
  }
}

class ProductPriceInfo {
  String? size;
  AvailableStockUnit? productUnit;
  String? productPrice;
  String? sId;

  ProductPriceInfo({this.size, this.productUnit, this.productPrice, this.sId});

  ProductPriceInfo.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    productUnit = json['productUnit'] != null
        ? AvailableStockUnit.fromJson(json['productUnit'])
        : null;
    productPrice = json['productPrice'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    if (productUnit != null) {
      data['productUnit'] = productUnit!.toJson();
    }
    data['productPrice'] = productPrice;
    data['_id'] = sId;
    return data;
  }
}
