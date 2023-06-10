import 'package:iverify/services/pref/pref_service.dart';

class LocalAuthService {
  LocalAuthService._();
  static LocalAuthService instance = LocalAuthService._();

  //** Passcode  */

  bool isPasscodeAvailable() {
    return PreferenceService.instance
        .getStringPrefValue(key: PrefKeys.localAuthCode)
        .isNotEmpty;
  }

  bool matchPasscode(String code) {
    return PreferenceService.instance
            .getStringPrefValue(key: PrefKeys.localAuthCode) ==
        code;
  }

  void setPasscode(String code) {
    PreferenceService.instance
        .setStringPrefValue(key: PrefKeys.localAuthCode, value: code);
  }

  //** Biometrics */
  bool isBiometricsEnabled() {
    return PreferenceService.instance
        .getBoolPrefValue(key: PrefKeys.isBiometricsEnabled);
  }

  void setBiometricsStatus(bool value) {
    PreferenceService.instance
        .setBoolPrefValue(key: PrefKeys.isBiometricsEnabled, value: value);
  }
}
