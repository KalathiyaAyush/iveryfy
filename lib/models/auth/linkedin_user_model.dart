class LinkedInUserResponseModel {
  User? user;
  String? token;
  bool? alreadyLogin;

  LinkedInUserResponseModel({this.user, this.token, this.alreadyLogin});

  LinkedInUserResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    alreadyLogin = json['alreadyLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['alreadyLogin'] = alreadyLogin;
    return data;
  }
}

class User {
  String? firstName;
  bool? status;
  String? nin;
  String? dob;
  String? lastName;
  String? natinality;
  String? firebaseUserId;
  String? email;
  String? picture;
  int? profileCompletionLevel;
  String? loginUsing;
  String? phone;
  String? name;

  User(
      {this.firstName,
      this.status,
      this.nin,
      this.dob,
      this.lastName,
      this.natinality,
      this.firebaseUserId,
      this.email,
      this.picture,
      this.profileCompletionLevel,
      this.loginUsing,
      this.phone,
      this.name});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    status = json['status'];
    nin = json['nin'];
    dob = json['dob'];
    lastName = json['lastName'];
    natinality = json['natinality'];
    firebaseUserId = json['firebase_user_id'];
    email = json['email'];
    picture = json['picture'];
    profileCompletionLevel = json['profile_completion_level'];
    loginUsing = json['login_using'];
    phone = json['phone'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['status'] = status;
    data['nin'] = nin;
    data['dob'] = dob;
    data['lastName'] = lastName;
    data['natinality'] = natinality;
    data['firebase_user_id'] = firebaseUserId;
    data['email'] = email;
    data['picture'] = picture;
    data['profile_completion_level'] = profileCompletionLevel;
    data['login_using'] = loginUsing;
    data['phone'] = phone;
    data['name'] = name;
    return data;
  }
}
