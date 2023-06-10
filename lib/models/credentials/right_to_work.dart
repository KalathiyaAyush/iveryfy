class RightToWorkResponseModel {
  String? message;
  int? status;
  dynamic data;
  bool? hasError;

  RightToWorkResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    hasError = json['hasError'];
  }
}

class RightToWorkRequestModel {
  RightToWorkRequestModel({required this.credentialId});
  String? credentialId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['credential_id'] = credentialId;
    return data;
  }
}
