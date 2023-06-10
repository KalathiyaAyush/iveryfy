class InviteRecipientResponseModel {
/*
{
  "credential_requests": [
    "JMZ3HeSivH9yJR3siUG0_kb9aVRjabdxXi9zG0J3n"
  ]
} 
*/

  List<String?>? credentialRequests;

  InviteRecipientResponseModel({
    this.credentialRequests,
  });
  InviteRecipientResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['credential_requests'] != null) {
      final v = json['credential_requests'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      credentialRequests = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (credentialRequests != null) {
      final v = credentialRequests;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['credential_requests'] = arr0;
    }
    return data;
  }
}
