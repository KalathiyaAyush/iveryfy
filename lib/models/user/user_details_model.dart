class UserDetailsModel {
  UserModel? user;

  UserDetailsModel({this.user});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}

class UserModel {
  String? minteliumId;
  String? dob;
  String? picture;
  String? walletId;
  String? name;
  String? firstName;
  int? profileCompletionLevel;
  String? email;
  String? firebaseUserId;
  bool? emailVerified;
  Address? address;
  bool? status;
  String? natinality;
  String? nin;
  String? lastName;
  String? phone;
  bool? notifications;
  bool? isDeleted;

  UserModel({
    this.minteliumId,
    this.dob,
    this.picture,
    this.walletId,
    this.name,
    this.firstName,
    this.profileCompletionLevel,
    this.email,
    this.firebaseUserId,
    this.emailVerified,
    this.address,
    this.status,
    this.natinality,
    this.nin,
    this.lastName,
    this.phone,
    this.notifications,
    this.isDeleted,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    minteliumId = json['mintelium_id'];
    dob = json['dob'];
    picture = json['picture'];
    walletId = json['walletId'];
    name = json['name'];
    firstName = json['firstName'];
    profileCompletionLevel = json['profile_completion_level'];
    email = json['email'];
    firebaseUserId = json['firebase_user_id'];
    emailVerified = json['email_verified'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    status = json['status'];
    natinality = json['natinality'];
    nin = json['nin'];
    lastName = json['lastName'];
    phone = json['phone'];
    notifications = json['notifications'];
  }

  Map<String, dynamic> toParam() {
    return {
      if (dob != null) "dob": dob,
      if (picture != null) "picture": picture,
      if (firstName != null) "firstName": firstName,
      if (email != null) "email": email,
      if (natinality != null) "natinality": natinality,
      if (nin != null) "nin": nin,
      if (lastName != null) "lastName": lastName,
      if (phone != null) "phone": phone,
      if (notifications != null) "notifications": notifications,
      if (isDeleted != null) "is_deleted": isDeleted
    };
  }
}

class Address {
  String? line1;
  String? pincode;
  String? contry;
  String? line2;
  String? city;

  Address({this.line1, this.pincode, this.contry, this.line2, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
    pincode = json['pincode'];
    contry = json['contry'];
    line2 = json['line2'];
    city = json['city'];
  }
}
