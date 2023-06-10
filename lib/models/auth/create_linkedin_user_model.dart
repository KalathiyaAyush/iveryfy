class LinkedInCreateUserReqModel {
  String? name;
  String? email;
  String? userId;
  String? picture;

  LinkedInCreateUserReqModel(
      {this.name, this.email, this.userId, this.picture});

  LinkedInCreateUserReqModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    userId = json['user_id'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['user_id'] = userId;
    data['picture'] = picture;
    return data;
  }
}
