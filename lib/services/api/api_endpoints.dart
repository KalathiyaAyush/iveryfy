class APIEndpoints {
  const APIEndpoints._();

  // static String get baseUrl =>
  //     'https://lfoqhz9845.execute-api.eu-west-2.amazonaws.com/prod/api/v1';
  static String get baseUrl =>
      'https://qgjnrd3cdf.execute-api.eu-west-2.amazonaws.com/prod/api/v1';

  static String get postSignUp => '$baseUrl/users/postsignup';
  static String get addBasicDetails => '$baseUrl/users/basic';
  static String get addAddressDetails => '$baseUrl/users/address';
  static String get updateProfile => '$baseUrl/users/updateProfile';
  static String get updateUser => '$baseUrl/users/updateUser';
  static String get uploadImage => '$baseUrl/users/uploadImage';
  static String get linkedInSignup => '$baseUrl/users/LinkedInSignup';
  static String get createYotiSession => '$baseUrl/users/yoti/create-session';
  static String get listAllCredentials => '$baseUrl/users/listAllCredentials';
  static String get userDetials => '$baseUrl/users/me';
  static String get rightToWork => '$baseUrl/users/right_to_work';
  static String get inviteRecipient => '$baseUrl/users/inviteRecipient';
  static String get inviteRecipientMulti => '$baseUrl/users/inviteRecipientMulti';
  static String get listOfCredentialsRequest =>
      '$baseUrl/users/listOfCredentialsRequest';
  static String get updateCredentialsRequest =>
      "$baseUrl/users/updateCredentialsRequest";
  static String get getMnemonic => "$baseUrl/users/mnemonic";
  static String get homeDetails => '$baseUrl/users/home';
  static String get recipientAction => '$baseUrl/users/updateCredentialsRequestActivity';
  static String get profileDataUpdateAction => '$baseUrl/users/updatePrivateDataRequest';
}
