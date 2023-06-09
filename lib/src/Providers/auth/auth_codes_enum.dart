enum FirebaseAuthCodes {
  emailAlreadyInUse,
}

extension FirebaseCodeNames on FirebaseAuthCodes {
  String get code {
    switch (this) {
      case FirebaseAuthCodes.emailAlreadyInUse:
        return "email-already-in-use";
    }
  }
}
