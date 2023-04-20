class DailyNeedsCategory {
  int? id;
  String? name;
  String? categoryImg;

  DailyNeedsCategory({this.id, this.name, this.categoryImg});

  DailyNeedsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryImg = json['category_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_img'] = this.categoryImg;
    return data;
  }
}