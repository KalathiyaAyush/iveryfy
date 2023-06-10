class CredentialStatusListModel {
  int? status;
  CredStatusData? data;
  bool? hasError;
  String? message;

  CredentialStatusListModel(
      {this.status, this.data, this.hasError, this.message});

  CredentialStatusListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? CredStatusData.fromJson(json['data']) : null;
    hasError = json['hasError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['hasError'] = hasError;
    data['message'] = message;
    return data;
  }
}

class CredStatusData {
  List<Requests>? requests;

  CredStatusData({this.requests});

  CredStatusData.fromJson(Map<String, dynamic> json) {
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  String? id;
  String? recipientId;
  List<Credentials>? credentials;
  int? updatedAt;
  String? applicantId;
  CreatedAt? createdAt;
  int? createdAtTimestamp;
  String? status;
  Recipients? recipients;

  Requests(
      {this.id,
      this.recipientId,
      this.credentials,
      this.updatedAt,
      this.applicantId,
      this.createdAt,
      this.createdAtTimestamp,
      this.status,
      this.recipients});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipientId = json['recipient_id'];
    if (json['credentials'] != null) {
      credentials = <Credentials>[];
      json['credentials'].forEach((v) {
        credentials!.add(Credentials.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
    applicantId = json['applicant_id'];
    createdAt = json['created_at'] != null
        ? CreatedAt.fromJson(json['created_at'])
        : null;
    createdAtTimestamp = json['created_at_timestamp'];
    status = json['status'];
    recipients = json['recipients'] != null
        ? Recipients.fromJson(json['recipients'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipient_id'] = recipientId;
    if (credentials != null) {
      data['credentials'] = credentials!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = updatedAt;
    data['applicant_id'] = applicantId;
    if (createdAt != null) {
      data['created_at'] = createdAt!.toJson();
    }
    data['created_at_timestamp'] = createdAtTimestamp;
    data['status'] = status;
    if (recipients != null) {
      data['recipients'] = recipients!.toJson();
    }
    return data;
  }
}

class Credentials {
  String? expiryDate;
  String? credentialId;
  String? status;

  Credentials({this.expiryDate, this.credentialId, this.status});

  Credentials.fromJson(Map<String, dynamic> json) {
    expiryDate = json['expiry_date'];
    credentialId = json['credential_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expiry_date'] = expiryDate;
    data['credential_id'] = credentialId;
    data['status'] = status;
    return data;
  }
}

class CreatedAt {
  int? iSeconds;
  int? iNanoseconds;

  CreatedAt({this.iSeconds, this.iNanoseconds});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}

class Recipients {
  bool? notification;
  String? firebaseUserId;
  bool? emailVerified;
  String? picture;
  int? profileCompletionLevel;
  String? email;
  String? walletId;
  bool? status;
  String? name;

  Recipients(
      {this.notification,
      this.firebaseUserId,
      this.emailVerified,
      this.picture,
      this.profileCompletionLevel,
      this.email,
      this.walletId,
      this.status,
      this.name});

  Recipients.fromJson(Map<String, dynamic> json) {
    notification = json['notification'];
    firebaseUserId = json['firebase_user_id'];
    emailVerified = json['email_verified'];
    picture = json['picture'];
    profileCompletionLevel = json['profile_completion_level'];
    email = json['email'];
    walletId = json['walletId'];
    status = json['status'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification'] = notification;
    data['firebase_user_id'] = firebaseUserId;
    data['email_verified'] = emailVerified;
    data['picture'] = picture;
    data['profile_completion_level'] = profileCompletionLevel;
    data['email'] = email;
    data['walletId'] = walletId;
    data['status'] = status;
    data['name'] = name;
    return data;
  }
}
