class ProfileResponse {
  ProfileMessage? message;
  Contact? contact;
  bool? status;

  ProfileResponse({this.message, this.contact, this.status});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? ProfileMessage.fromJson(json['message']) : null;
    contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List<Null>? address;
  String? id;
  int? number;
  int? tokenVersion;
  bool? isOnboardingCompleted;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? version;
  int? pincode;

  ProfileMessage({
    this.cart,
    this.address,
    this.id,
    this.number,
    this.tokenVersion,
    this.isOnboardingCompleted,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.pincode,
  });

  ProfileMessage.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    if (json['address'] != null) {
      address = <Null>[];
      json['address'].forEach((v) {
        address!.add(null);
      });
    }
    id = json['_id'];
    number = json['number'];
    tokenVersion = json['tokenVersion'];
    isOnboardingCompleted = json['isOnboardingCompleted'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    if (address != null) {
      data['address'] = address!.map((v) => null).toList();
    }
    data['_id'] = id;
    data['number'] = number;
    data['tokenVersion'] = tokenVersion;
    data['isOnboardingCompleted'] = isOnboardingCompleted;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = version;
    data['pincode'] = pincode;
    return data;
  }
}

class Cart {
  List<Null>? items;

  Cart({this.items});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Null>[];
      json['items'].forEach((v) {
        items!.add(null);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => null).toList();
    }
    return data;
  }
}

class Contact {
  String? id;
  String? email;
  int? mobile;
  String? whatsapp;

  Contact({this.id, this.email, this.mobile, this.whatsapp});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    mobile = json['mobile'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['email'] = email;
    data['mobile'] = mobile;
    data['whatsapp'] = whatsapp;
    return data;
  }
}
