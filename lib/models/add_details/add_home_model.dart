class AddHomeDetailsReqModel {
  String? line1;
  String? line2;
  String? city;
  String? pincode;
  String? contry;

  AddHomeDetailsReqModel(
      {this.line1, this.line2, this.city, this.pincode, this.contry});

  AddHomeDetailsReqModel.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    pincode = json['pincode'];
    contry = json['contry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['line1'] = line1;
    data['line2'] = line2;
    data['city'] = city;
    data['pincode'] = pincode;
    data['contry'] = contry;
    return data;
  }
}
