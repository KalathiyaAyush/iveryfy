
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthRepo {
  Future<void> signInWith(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> signUpWith(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return false;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      rethrow;
    }
  }

  // Future<void> signInWithFacebook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //     await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
  //
  // Future<void> signInWithApple() async {
  //   try {
  //     final rawNonce = generateNonce();
  //     final nonce = sha256ofString(rawNonce);
  //
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //       webAuthenticationOptions: WebAuthenticationOptions(
  //         clientId: "com.app.mintelium.applelogin",
  //         redirectUri:
  //             Uri.parse("https://minteliumapp.firebaseapp.com/__/auth/handler"),
  //       ),
  //       nonce: nonce,
  //     );
  //     final oauthCredential = OAuthProvider("apple.com").credential(
  //       idToken: appleCredential.identityToken,
  //       rawNonce: rawNonce,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(
  //       oauthCredential,
  //     );
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
  //
  // String generateNonce([int length = 32]) {
  //   const charset =
  //       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  //   final random = Random.secure();
  //   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
  //       .join();
  // }

  // /// Returns the sha256 hash of [input] in hex notation.
  // String sha256ofString(String input) {
  //   final bytes = utf8.encode(input);
  //   final digest = sha256.convert(bytes);
  //   return digest.toString();
  // }
  //
  // Future<APIResponse<dynamic>> postSignUp() async {
  //   final request = APIRequest(
  //     url: APIEndpoints.postSignUp,
  //     methodType: MethodType.GET,
  //   );
  //   final response = await APIService.instance.callService(
  //     request,
  //     create: (data) {
  //       return PostSignUpDataModel.fromJson(data);
  //     },
  //   );
  //
  //   return response;
  // }
  //
  // Future<APIResponse<dynamic>> createLinkedInUser(
  //     LinkedInCreateUserReqModel data) async {
  //   final request = APIRequest(
  //     url: APIEndpoints.linkedInSignup,
  //     methodType: MethodType.POST,
  //     params: data.toJson(),
  //   );
  //   final response = await APIService.instance.callService(
  //     request,
  //     create: (data) {
  //       return LinkedInUserResponseModel.fromJson(data);
  //     },
  //   );
  //
  //   return response;
  // }
  //
  // Future<APIResponse<dynamic>> updateFCMToken() async {
  //   final token = await FirebaseMessagingService.instance.getToken();
  //   final request = APIRequest(
  //     url: APIEndpoints.updateUser,
  //     methodType: MethodType.POST,
  //     params: {"fcm_token": token},
  //   );
  //   final response = await APIService.instance.callService(
  //     request,
  //   );
  //
  //   return response;
  // }
}
