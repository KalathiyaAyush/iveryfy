class AddRecipeintReqModel {
  String? credentialRequestId;
  List<ReqCredentials>? credentials;

  AddRecipeintReqModel({this.credentialRequestId, this.credentials});

  AddRecipeintReqModel.fromJson(Map<String, dynamic> json) {
    credentialRequestId = json['credential_request_id'];
    if (json['credentials'] != null) {
      credentials = <ReqCredentials>[];
      json['credentials'].forEach((v) {
        credentials!.add(ReqCredentials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credential_request_id'] = credentialRequestId;
    if (credentials != null) {
      data['credentials'] = credentials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReqCredentials {
  String? credentialId;
  String? expiryDate;
  String? status;

  ReqCredentials({this.credentialId, this.expiryDate, this.status});

  ReqCredentials.fromJson(Map<String, dynamic> json) {
    credentialId = json['credential_id'];
    expiryDate = json['expiry_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credential_id'] = credentialId;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    return data;
  }
}
