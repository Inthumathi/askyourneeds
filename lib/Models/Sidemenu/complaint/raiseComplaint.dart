class RaiseComplaintResponse {
  Message? message;
  bool? status;

  RaiseComplaintResponse({this.message, this.status});

  RaiseComplaintResponse.fromJson(Map<String, dynamic> json) {
    message =
    json['message'] != null ? Message.fromJson(json['message']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Message {
  String? ticketId;
  String? subject;
  bool? isActive;
  String? lastActivity;
  List<RaiseComplaintMessages>? messages;
  String? raisedBy;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Message(
      {this.ticketId,
        this.subject,
        this.isActive,
        this.lastActivity,
        this.messages,
        this.raisedBy,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Message.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    subject = json['subject'];
    isActive = json['isActive'];
    lastActivity = json['last_activity'];
    if (json['messages'] != null) {
      messages = <RaiseComplaintMessages>[];
      json['messages'].forEach((v) {
        messages!.add(RaiseComplaintMessages.fromJson(v));
      });
    }
    raisedBy = json['raisedBy'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['subject'] = subject;
    data['isActive'] = isActive;
    data['last_activity'] = lastActivity;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['raisedBy'] = raisedBy;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class RaiseComplaintMessages {
  String? message;
  String? sentBy;
  String? createdAt;

  RaiseComplaintMessages({this.message, this.sentBy, this.createdAt});

  RaiseComplaintMessages.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sentBy = json['sentBy'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['sentBy'] = sentBy;
    data['createdAt'] = createdAt;
    return data;
  }
}
