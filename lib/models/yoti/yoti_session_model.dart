class YotiSessionResponse {
  int? status;
  YotiSessionData? data;
  bool? hasError;
  String? message;

  YotiSessionResponse({this.status, this.data, this.hasError, this.message});

  YotiSessionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? YotiSessionData.fromJson(json['data']) : null;
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

class YotiSessionData {
  String? iframeUrl;

  YotiSessionData({this.iframeUrl});

  YotiSessionData.fromJson(Map<String, dynamic> json) {
    iframeUrl = json['iframeUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iframeUrl'] = iframeUrl;
    return data;
  }
}
