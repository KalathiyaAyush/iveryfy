import 'package:flutter/material.dart';
import 'package:iverify/src/uis/screens/settings/iverifi_id_screen.dart';
import '/src/resources/font_manager.dart';
import '/src/resources/color_manager.dart';
import '/src/resources/style_manager.dart';
import '/src/resources/string_manager.dart';

import '/src/uis/screens/home/home_screen.dart';
import '/src/uis/screens/login/login_screen.dart';
import '/src/uis/screens/signup/signup_screen.dart';
import '/src/uis/screens/settings/setting_screen.dart';
import '../uis/screens/documents/passport_screen.dart';
import '/src/uis/screens/settings/security_screen.dart';
import '/src/uis/screens/documents/document_screen.dart';
import '/src/uis/screens/verify_id/verify_id_screen.dart';
import '/src/uis/screens/login/enter_passcode_screen.dart';
import '/src/uis/screens/verify_id/add_government_id.dart';
import '/src/uis/screens/splash_screen/splash_screen.dart';
import '/src/uis/screens/signup/signup_success_screen.dart';
import '/src/uis/screens/splash_screen/welcome_screen.dart';
import '/src/uis/screens/verify_id/id_passport_screen.dart';
import '/src/uis/screens/connections/connection_screen.dart';
import '/src/uis/screens/settings/profile_details_screen.dart';
import '/src/uis/screens/verify_id/passport_added_screen.dart';
import '/src/uis/screens/add_details/home_address_screen.dart';
import '/src/uis/screens/biometric/face_biometric_screen.dart';
import '/src/uis/screens/verify_email/verify_email_screen.dart';
import '/src/uis/screens/documents/passport_details_screen.dart';
import '/src/uis/screens/biometric/finger_biometric_screen.dart';
import '/src/uis/screens/verify_email/verified_email_screen.dart';
import '/src/uis/screens/settings/edit_profile_detail_screen.dart';
import '/src/uis/screens/add_details/add_basic_details_screen.dart';
import '../uis/screens/login/reset_pin/forgot_passcode_screen.dart';
import '/src/uis/screens/signup/passcode/enter_passcode_screen.dart';
import '../uis/screens/login/reset_pin/set_new_passcode_screen.dart';
import '/src/uis/screens/verify_id/document_verification_screen.dart';
import '/src/uis/screens/signup/passcode/confirm_passcode_screen.dart';
import '../uis/screens/login/reset_pin/confirm_new_passcode_screen.dart';
import '/src/uis/screens/bottom_navigation/bottom_navigation_screen.dart';
import '/src/uis/screens/documents/add_document/add_document_screen.dart';
import '/src/uis/screens/add_profile_photo/add_profile_photo_screen.dart';
import '/src/uis/screens/connections/add_connection/share_doc_screen.dart';
import '/src/uis/screens/documents/add_document/document_added_screen.dart';
import '../uis/screens/connections/add_connection/set_expirydate_screen.dart';
import '/src/uis/screens/connections/add_connection/add_connection_screen.dart';
import '/src/uis/screens/connections/add_connection/connection_added_screen.dart';
import '/src/uis/screens/connections/add_connection/connection_failed_screen.dart';
import '/src/uis/screens/connections/add_connection/connection_succes_screen.dart';
import '/src/uis/screens/connections/manage_connection/manage_connection_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String signupScreen = '/signup_screen';
  static const String signupSuccessScreen = '/signup-success';
  static const String enterYourPasscodeScreen = '/enter-your-passcode';
  static const String confirmPasscodeSignupScreen = '/confirm-passcode-signup';
  static const String loginScreen = '/login_screen';
  static const String enterPasscodeScreen = '/passcode_screen';
  static const String forgotPasscodeScreen = '/forgot-passcode';
  static const String setPasscodeScreen = '/set-passcode';
  static const String confirmPasscodeScreen = '/confirm-passcode';
  static const String verifyEmailScreen = '/verify_email';
  static const String verifiedEmailScreen = '/verified-email';
  static const String fingerBiometricScreen = '/finger-biometric';
  static const String faceBiometricScreen = '/face-biometric';
  static const String addBasicDetailScreen = '/add-basic-detail';
  static const String homeAddressScreen = '/home-address';
  static const String addProfilePhotoScreen = '/add-profile-photo';
  static const String idVerificationScreen = '/id-verification';
  static const String addGovernmentIDScreen = '/add-governmentID';
  static const String idPassportPhotoScreen = '/id-passport-photo';
  static const String checkPassportScreen = '/check-passport';
  static const String documentUploadedScreen = '/document-uploaded';
  static const String bottomNavigationScreen = '/bottom-navigation';
  static const String homeScreen = '/home-screen';
  static const String myDocumentsScreen = '/document-screen';
  static const String addDocumentScreen = '/add-document';
  static const String documentAddedScreen = '/doc-added';
  static const String passportScreen = '/passport';
  static const String connectionScreen = '/connection-screen';
  static const String passportDetailScreen = '/passport-detail';
  static const String addNewConnectionScreen = '/add-connection';
  static const String connectionAddedScreen = '/connection-added';
  static const String connectionFailedScreen = '/connection-failed';
  static const String shareDocumentScreen = '/share-document';
  static const String setExpiryDateScreen = '/set-expiry-date';
  static const String docSentScreen = '/doc-sent';
  static const String manageConnectionScreen = '/manage-connection';
  static const String settingScreen = '/setting-screen';
  static const String securityScreen = '/security-screen';
  static const String profileDetailScreen = '/profile-detail';
  static const String editProfileDetailScreen = '/edit-profile-detail';
  static const String iVerifiIDScreen = '/id-screen';

  static void popUntil(
    BuildContext context, {
    required String name,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      (_) => false,
      arguments: arguments,
    );
  }

  static void pushNamed(
    BuildContext context, {
    required String name,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(
      name,
      arguments: arguments,
    );
  }

  static void popTo(BuildContext context, {required String name}) {
    Navigator.of(context).popUntil(ModalRoute.withName(name));
  }
}

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SplashScreen(),
        );

      case AppRoutes.welcomeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const WelcomeScreen(),
        );

      case AppRoutes.signupScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SignupScreen(),
        );

      case AppRoutes.signupSuccessScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SignupSuccessScreen(),
        );

      case AppRoutes.enterYourPasscodeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const EnterYourPasscode(),
        );

      case AppRoutes.confirmPasscodeSignupScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ConfirmPasscodeSignup(),
        );

      case AppRoutes.loginScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SigninScreen(),
        );

      case AppRoutes.enterPasscodeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const EnterPasscodeScreen(),
        );

      case AppRoutes.forgotPasscodeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ForgotPasscodeScreen(),
        );

      case AppRoutes.setPasscodeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SetPasscodeScreen(),
        );

      case AppRoutes.confirmPasscodeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ConfirmPasscodeScreen(),
        );

      case AppRoutes.verifyEmailScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const VerifyEmailScreen(),
        );

      case AppRoutes.verifiedEmailScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const VerifiedEmailScreen(),
        );

      case AppRoutes.fingerBiometricScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const FingerBiometricScreen(),
        );

      case AppRoutes.faceBiometricScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const FaceBiometricScreen(),
        );

      case AppRoutes.addBasicDetailScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const AddBasicDetailsScreen(),
        );

      case AppRoutes.homeAddressScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const HomeAddressScreen(),
        );

      case AppRoutes.addProfilePhotoScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const AddProfilePhoto(),
        );

      case AppRoutes.idVerificationScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const VerifyIdScreen(),
        );

      case AppRoutes.addGovernmentIDScreen:
        return _buildRouteScreen(
          child: const AddGovernmentId(),
        );

      case AppRoutes.idPassportPhotoScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const IdPassportScreen(),
        );

      case AppRoutes.checkPassportScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const PassportAddedScreen(),
        );

      case AppRoutes.documentUploadedScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const DocumentVerificationScreen(),
        );

      case AppRoutes.bottomNavigationScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const BottomNavigationbarScreen(),
        );

      case AppRoutes.homeScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const HomeScreen(),
        );

      case AppRoutes.myDocumentsScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const MyDocumentScreen(),
        );

      case AppRoutes.addDocumentScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const AddDocumentScreen(),
        );

      case AppRoutes.documentAddedScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const DocumentAddedScreen(),
        );

      case AppRoutes.passportScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const PassportScreen(),
        );

      case AppRoutes.connectionScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ConnectionScreen(),
        );

      case AppRoutes.passportDetailScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const PassportDetailScreen(),
        );

      case AppRoutes.addNewConnectionScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const AddConnectionScreen(),
        );

      case AppRoutes.connectionAddedScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ConnectionAddedScreen(),
        );

      case AppRoutes.connectionFailedScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ConnectionFailedScreen(),
        );

      case AppRoutes.shareDocumentScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ShareDocumentScreen(),
        );

      case AppRoutes.setExpiryDateScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SetExpirydateScreen(),
        );

      case AppRoutes.docSentScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ConnectionSuccessScreen(),
        );

      case AppRoutes.manageConnectionScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ManageConnectionScreen(),
        );

      case AppRoutes.settingScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SettingsScreen(),
        );

      case AppRoutes.securityScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const SecurityScreen(),
        );

      case AppRoutes.profileDetailScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const ProfileDetailsScreen(),
        );

      case AppRoutes.editProfileDetailScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const EditProfileDetailScreen(),
        );

      case AppRoutes.iVerifiIDScreen:
        return _buildRouteScreen(
          name: routeSettings.name,
          child: const IverifiIDScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return _buildRouteScreen(
      child: Scaffold(
        body: Center(
          child: Text(
            AppStrings.kNoRouteFound,
            style: mediumTextStyle(
              fontSize: FontSize.s26,
              color: ColorManager.titleTextColor,
              fontFamily: FontConstants.quicksand,
            ),
          ),
        ),
      ),
    );
  }

  static MaterialPageRoute<dynamic> _buildRouteScreen({
    String? name,
    required Widget child,
  }) {
    return MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: name),
      builder: (_) => child,
    );
  }
}
