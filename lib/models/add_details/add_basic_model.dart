class AddBasicDetailsReqModel {
  String? firstName;
  String? lastName;
  String? dob;
  String? natinality;
  String? phone;
  String? nin;

  AddBasicDetailsReqModel({
    this.firstName,
    this.lastName,
    this.dob,
    this.natinality,
    this.phone,
    this.nin,
  });

  AddBasicDetailsReqModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    natinality = json['natinality'];
    phone = json['phone'];
    nin = json['nin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dob'] = dob;
    data['natinality'] = natinality;
    data['phone'] = phone;
    data['nin'] = nin;
    return data;
  }
}
