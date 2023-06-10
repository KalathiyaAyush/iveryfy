class PostSignUpModel {
  int? status;
  PostSignUpDataModel? data;
  bool? hasError;
  String? message;

  PostSignUpModel({this.status, this.data, this.hasError, this.message});

  PostSignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? PostSignUpDataModel.fromJson(json['data'])
        : null;
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

class PostSignUpDataModel {
  User? user;
  bool? alreadyLogin;

  PostSignUpDataModel({this.user, this.alreadyLogin});

  PostSignUpDataModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    alreadyLogin = json['alreadyLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['alreadyLogin'] = alreadyLogin;
    return data;
  }
}

class User {
  String? picture;
  String? email;
  String? natinality;
  int? profileCompletionLevel;
  String? nin;
  String? lastName;
  String? firstName;
  String? dob;
  bool? status;
  String? phone;
  String? name;
  String? firebaseUserId;
  bool? emailVerified;

  User(
      {this.picture,
      this.email,
      this.natinality,
      this.profileCompletionLevel,
      this.nin,
      this.lastName,
      this.firstName,
      this.dob,
      this.status,
      this.phone,
      this.name,
      this.firebaseUserId,
      this.emailVerified});

  User.fromJson(Map<String, dynamic> json) {
    picture = json['picture'];
    email = json['email'];
    natinality = json['natinality'];
    profileCompletionLevel = json['profile_completion_level'];
    nin = json['nin'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    dob = json['dob'];
    status = json['status'];
    phone = json['phone'];
    name = json['name'];
    firebaseUserId = json['firebase_user_id'];
    emailVerified = json['email_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['picture'] = picture;
    data['email'] = email;
    data['natinality'] = natinality;
    data['profile_completion_level'] = profileCompletionLevel;
    data['nin'] = nin;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['dob'] = dob;
    data['status'] = status;
    data['phone'] = phone;
    data['name'] = name;
    data['firebase_user_id'] = firebaseUserId;
    data['email_verified'] = emailVerified;
    return data;
  }
}
