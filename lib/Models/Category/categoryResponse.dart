class CategoryResponse {
  List<Message>? message;

  CategoryResponse({this.message});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.message != null) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  List<SubCategories>? subCategories;
  bool? isShownToHomepage;
  int? iV;

  Message(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.subCategories,
        this.isShownToHomepage,
        this.iV});

  Message.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    if (json['subCategories'] != null) {
      subCategories = <SubCategories>[];
      json['subCategories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
    isShownToHomepage = json['isShownToHomepage'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['hindiName'] = this.hindiName;
    data['teluguName'] = this.teluguName;
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    data['isShownToHomepage'] = this.isShownToHomepage;
    data['__v'] = this.iV;
    return data;
  }
}

class SubCategories {
  String? sId;
  String? name;
  String? hindiName;
  String? teluguName;
  String? parent;
  String? bannerImg;
  bool? isShownToHomepage;
  int? iV;

  SubCategories(
      {this.sId,
        this.name,
        this.hindiName,
        this.teluguName,
        this.parent,
        this.bannerImg,
        this.isShownToHomepage,
        this.iV});

  SubCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    hindiName = json['hindiName'];
    teluguName = json['teluguName'];
    parent = json['parent'];
    bannerImg = json['bannerImg'];
    isShownToHomepage = json['isShownToHomepage'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['hindiName'] = this.hindiName;
    data['teluguName'] = this.teluguName;
    data['parent'] = this.parent;
    data['bannerImg'] = this.bannerImg;
    data['isShownToHomepage'] = this.isShownToHomepage;
    data['__v'] = this.iV;
    return data;
  }
}