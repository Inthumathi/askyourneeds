// class CategoriesResponse {
//   Message message;
//   bool status;
//
//   CategoriesResponse({this.message, this.status});
//
//   CategoriesResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'] != null ? new Message.fromJson(json['message']) : null;
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.message != null) {
//       data['message'] = this.message.toJson();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class Message {
//   List<Category> category;
//   List<List> subcategory;
//
//   Message({this.category, this.subcategory});
//
//   Message.fromJson(Map<String, dynamic> json) {
//     if (json['category'] != null) {
//       category = new List<Category>();
//       json['category'].forEach((v) { category.add(new Category.fromJson(v)); });
//     }
//     if (json['subcategory'] != null) {
//       subcategory = new List<List>();
//       json['subcategory'].forEach((v) { subcategory.add(new List.fromJson(v)); });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.category != null) {
//       data['category'] = this.category.map((v) => v.toJson()).toList();
//     }
//     if (this.subcategory != null) {
//       data['subcategory'] = this.subcategory.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Category {
//   String sId;
//   String name;
//   String hindiName;
//   String teluguName;
//   String branchId;
//   Location location;
//   int iV;
//
//   Category({this.sId, this.name, this.hindiName, this.teluguName, this.branchId, this.location, this.iV});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     hindiName = json['hindiName'];
//     teluguName = json['teluguName'];
//     branchId = json['branchId'];
//     location = json['location'] != null ? new Location.fromJson(json['location']) : null;
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['hindiName'] = this.hindiName;
//     data['teluguName'] = this.teluguName;
//     data['branchId'] = this.branchId;
//     if (this.location != null) {
//       data['location'] = this.location.toJson();
//     }
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class Location {
//   String type;
//   List<double> coordinates;
//   String sId;
//
//   Location({this.type, this.coordinates, this.sId});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<double>();
//     sId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     data['_id'] = this.sId;
//     return data;
//   }
// }
//
// class Subcategory {
//
//
//   Subcategory({});
//
// Subcategory.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }
