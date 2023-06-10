// ignore_for_file: avoid_function_literals_in_foreach_calls

class UpdateRecipientReqModelCredentials {
  String? credentialId;
  String? expiryDate;
  String? status;

  UpdateRecipientReqModelCredentials({
    this.credentialId,
    this.expiryDate,
    this.status,
  });
  UpdateRecipientReqModelCredentials.fromJson(Map<String, dynamic> json) {
    credentialId = json['credential_id']?.toString();
    expiryDate = json['expiry_date']?.toString();
    status = json['status']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['credential_id'] = credentialId;
    data['expiry_date'] = expiryDate;
    data['status'] = status;
    return data;
  }
}

class UpdateRecipientRequestModel {
  String? credentialRequestId;
  String? status;
  List<UpdateRecipientReqModelCredentials?>? credentials;

  UpdateRecipientRequestModel({
    this.credentialRequestId,
    this.status,
    this.credentials,
  });
  UpdateRecipientRequestModel.fromJson(Map<String, dynamic> json) {
    credentialRequestId = json['credential_request_id']?.toString();
    status = json['status']?.toString();
    if (json['credentials'] != null) {
      final v = json['credentials'];
      final arr0 = <UpdateRecipientReqModelCredentials>[];
      v.forEach((v) {
        arr0.add(UpdateRecipientReqModelCredentials.fromJson(v));
      });
      credentials = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['credential_request_id'] = credentialRequestId;
    data['status'] = status;
    if (credentials != null) {
      final v = credentials;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['credentials'] = arr0;
    }
    return data;
  }
}
