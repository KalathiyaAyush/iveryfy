class UploadProfileResponseModel {
  int? status;
  UploadProfileData? data;
  bool? hasError;
  String? message;

  UploadProfileResponseModel(
      {this.status, this.data, this.hasError, this.message});

  UploadProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        json['data'] != null ? UploadProfileData.fromJson(json['data']) : null;
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

class UploadProfileData {
  String? s3url;

  UploadProfileData({this.s3url});

  UploadProfileData.fromJson(Map<String, dynamic> json) {
    s3url = json['s3url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s3url'] = s3url;
    return data;
  }
}
