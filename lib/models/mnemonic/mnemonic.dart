class GetMnemonicResponse {
  int? status;
  Mnemonic? data;
  bool? hasError;
  String? message;

  GetMnemonicResponse({this.status, this.data, this.hasError, this.message});

  GetMnemonicResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Mnemonic.fromJson(json['data']) : null;
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

class Mnemonic {
  String? mnemonic;

  Mnemonic.fromJson(Map<String, dynamic> json) {
    mnemonic = json['mnemonic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mnemonic'] = mnemonic;
    return data;
  }
}
