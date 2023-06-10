// ignore_for_file: avoid_function_literals_in_foreach_calls



class UpdateProfileDataRequestModel {
  String? request_id;
  String? status;


  UpdateProfileDataRequestModel({
    this.request_id,
    this.status,
  });
  UpdateProfileDataRequestModel.fromJson(Map<String, dynamic> json) {
    request_id = json['request_id']?.toString();
    status = json['status']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['request_id'] = request_id;
    data['status'] = status;
    return data;
  }
}
