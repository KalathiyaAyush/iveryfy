import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../utils/utility_helper.dart';
import 'auth_codes_enum.dart';

class AuthProvider with ChangeNotifier {



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



}
