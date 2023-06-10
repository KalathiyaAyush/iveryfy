import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/auth/linkedin_user_model.dart';
import '../../../models/auth/post_signup.dart';
import '../../resources/string_manager.dart';
import '../../utils/utility_helper.dart';
import 'auth_codes_enum.dart';
import 'auth_repo.dart';

class AuthProvider with ChangeNotifier {
  final _authRepo = AuthRepo();

  PostSignUpDataModel? postSignUpModel;
  LinkedInUserResponseModel? linkedInUserData;


  Future<void> signInWithGoogle() async {
    try {
       await _authRepo.signInWithGoogle();
      final userToken =
          await FirebaseAuth.instance.currentUser?.getIdToken() ?? '';
      // PreferenceService.instance
      //     .setStringPrefValue(key: PrefKeys.token, value: userToken);
    } catch (error) {
      UtilityHelper.showToast(message: "Somthing Went wrong!");
    }
  }

  Future<bool> updateFCMToken() async {
    final response = await _authRepo.updateFCMToken();
    if (!(response.hasError ?? false)) {
      return true;
    }
    UtilityHelper.showToast(message: response.message ?? "");
    return false;
  }
  Future<bool> postSignUp() async {
    final response = await _authRepo.postSignUp();
    if (!(response.hasError ?? false)) {
      postSignUpModel = response.data as PostSignUpDataModel;
      return await updateFCMToken();
    }
    UtilityHelper.showToast(message: response.message ?? "");
    return false;
  }

}
