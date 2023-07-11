class ComplaintHistoryResponse {
  List<ComplaintHistoryMessage>? message;
  bool? status;

  ComplaintHistoryResponse({this.message, this.status});

  ComplaintHistoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = <ComplaintHistoryMessage>[];
      json['message'].forEach((v) {
        message!.add( ComplaintHistoryMessage.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class ComplaintHistoryMessage {
  String? sId;
  String? ticketId;
  String? subject;
  bool? isActive;
  String? lastActivity;
  List<Messages>? messages;
  String? raisedBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? closedBy;

  ComplaintHistoryMessage(
      {this.sId,
        this.ticketId,
        this.subject,
        this.isActive,
        this.lastActivity,
        this.messages,
        this.raisedBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.closedBy});

  ComplaintHistoryMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ticketId = json['ticketId'];
    subject = json['subject'];
    isActive = json['isActive'];
    lastActivity = json['last_activity'];
    if (json['messages'] != null) {
      messages =  <Messages>[];
      json['messages'].forEach((v) {
        messages!.add( Messages.fromJson(v));
      });
    }
    raisedBy = json['raisedBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    closedBy = json['closedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['ticketId'] = ticketId;
    data['subject'] = subject;
    data['isActive'] = isActive;
    data['last_activity'] = lastActivity;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    data['raisedBy'] = raisedBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['closedBy'] = closedBy;
    return data;
  }
}

class Messages {
  String? message;
  String? sentBy;
  String? createdAt;

  Messages({this.message, this.sentBy, this.createdAt});

  Messages.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sentBy = json['sentBy'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    data['sentBy'] = sentBy;
    data['createdAt'] = createdAt;
    return data;
  }
}
