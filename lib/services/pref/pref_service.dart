import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  PrefKeys._();
  static String get username => 'username';
  static String get password => 'password';
  static String get token => 'token';
  static String get user => 'user';
  static String get isCompletedWelcome => 'isCompletedWelcome';
  static String get localAuthCode => 'localAuthCode';
  static String get isBiometricsEnabled => 'isBiometricsEnabled';
  static String get isLoggedIn => 'isLoggedIn';
}

class PreferenceService {
  PreferenceService._();
  static PreferenceService instance = PreferenceService._();

  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setBoolPrefValue({
    required String key,
    required bool value,
  }) {
    _prefs.setBool(key, value);
  }

  bool getBoolPrefValue({required String key}) {
    return _prefs.getBool(key) ?? false;
  }

  void setStringPrefValue({
    required String key,
    required String value,
  }) {
    _prefs.setString(key, value);
  }

  String getStringPrefValue({required String key}) {
    return _prefs.getString(key) ?? '';
  }

  void setMapPrefValue({
    required String key,
    required Map<String, dynamic> value,
  }) {
    final String encodedString = json.encode(value);
    _prefs.setString(key, encodedString);
  }

  Map<String, dynamic>? getMapPrefValue({
    required String key,
  }) {
    final String decodedString = _prefs.getString(key) ?? '';
    return decodedString.isEmpty
        ? null
        : json.decode(decodedString) as Map<String, dynamic>?;
  }

  void setIntPrefValue({
    required String key,
    required int value,
  }) {
    _prefs.setInt(key, value);
  }

  int getIntPrefValue({
    required String key,
  }) {
    return _prefs.getInt(key) ?? 2;
  }

  Future<bool> clear() async {
    final bool value = await _prefs.clear();
    return value;
  }

  Future<bool> clearKey(String key) async {
    final bool value = await _prefs.remove(key);
    return value;
  }
}
