class ProfileResponse {
  ProfileMessage? message;
  Contact? contact;
  bool? status;

  ProfileResponse({this.message, this.contact, this.status});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message =
        json['message'] != null ? ProfileMessage.fromJson(json['message']) : null;
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class ProfileMessage {
  Cart? cart;
  String? sId;
  int? number;
  int? tokenVersion;
  bool? isOnboardingCompleted;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Location? location;
  int? pincode;
  String? language;
  String? name;
  String? email;
  String? profilePic;
  List<String>? address;

  ProfileMessage(
      {this.cart,
      this.sId,
      this.number,
      this.tokenVersion,
      this.isOnboardingCompleted,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.location,
      this.pincode,
      this.language,
      this.name,
      this.email,
      this.profilePic,
      this.address});

  ProfileMessage.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    sId = json['_id'];
    number = json['number'];
    tokenVersion = json['tokenVersion'];
    isOnboardingCompleted = json['isOnboardingCompleted'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    pincode = json['pincode'];
    language = json['language'];
    name = json['name'];
    email = json['email'];
    profilePic = json['profilePic'];
    address = json['address'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    data['_id'] = this.sId;
    data['number'] = this.number;
    data['tokenVersion'] = this.tokenVersion;
    data['isOnboardingCompleted'] = this.isOnboardingCompleted;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['pincode'] = this.pincode;
    data['language'] = this.language;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['address'] = this.address;
    return data;
  }
}

class Cart {
  ServiceType? serviceType;
  List<String>? items;

  Cart({this.serviceType, this.items});

  Cart.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'] != null
        ? ServiceType.fromJson(json['serviceType'])
        : null;
    items = json['items'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceType != null) {
      data['serviceType'] = serviceType!.toJson();
    }
    data['items'] = this.items;
    return data;
  }
}

class ServiceType {
  String? type;
  String? productUnit;

  ServiceType({this.type, this.productUnit});

  ServiceType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    productUnit = json['productUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['productUnit'] = this.productUnit;
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

class Contact {
  String? sId;
  int? mobile;
  String? email;
  String? whatsapp;

  Contact({this.sId, this.mobile, this.email, this.whatsapp});

  Contact.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    email = json['email'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}
