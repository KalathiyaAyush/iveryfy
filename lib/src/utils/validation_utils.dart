// ignore_for_file: prefer_is_empty, unused_local_variable

class ValidationMSG {
  // User Name
  static const String kUserNameIsEmpty = 'Username is required.';
  static const String kInstituteIsEmpty = 'Institute is required.';

  // First Name
  static const String kSchoolNameIsEmpty = 'Please enter your school name.';
  static const String kSchoolNameLengthValidation =
      // ignore: lines_longer_than_80_chars
      'Please enter school name at least 3 characters and not more than 50 characters.';

  // Last Name
  static const String kLastNameIsEmpty = 'Please enter your last name.';
  static const String kLastNameLengthValidation =
      // ignore: lines_longer_than_80_chars
      'Please enter last name at least 3 characters and not more than 50 characters.';

  // Email
  static const String kEmailIsEmpty = 'Please enter your email address.';
  static const String kInvalidEmail = 'Please enter valid email address.';

  // Mobile
  static const String kPhoneNumberIsEmpty = 'Please enter your phone number.';
  static const String kInvalidMobile = 'Please enter valid phone number.';

  // Mobile
  static const String kOTPIsEmpty = 'Please enter OTP.';
  static const String kInvalidOTP = 'Please enter valid OTP.';

  // PingCode
  static const String kPingCodeIsEmpty = 'Please enter your pin code number.';
  static const String kInvalidPincode = 'Please enter valid pin code number.';

  // PSPCode
  static const String kPSPCodeIsEmpty = 'Please enter postcode.';
  static const String kInvalidPSPcode = 'Please enter valid PSP code number.';

  // Mobile
  static const String kEmergencyPhoneNumberIsEmpty =
      'Please enter your emergency phone number.';
  static const String kInvalidEmergencyPhoneNumber =
      'Please enter valid emergency phone number.';

  // OTP
  static const String kOtpIsEmpty = 'Please enter received OTP.';
  static const String kInvalidOtp = 'Please enter valid OTP.';

  // Password
  static const String kPasswordIsEmpty = 'Password is required.';
  static const String kPasswordLengthValidation =
      'Please enter password at least 6 characters.';
  static const String kPasswordNotMatching = 'Passwords are not matching.';
  static const String kConfirmPasswordIsEmpty = 'Confirm password is required.';

  // Message
  static const String kMessageIsEmpty = 'Message is required.';
  static const String kMessageLengthValidation =
      'Please enter message at least 12 characters.';

  // Remarks
  static const String kRemarkLengthValidation =
      'Please enter remarks at least 12 characters if you have any.';

  // Medical
  static const String kMedicalLengthValidation =
      'Please enter medical history at least 12 characters if you have any.';

  // Address
  static const String kAddressIsEmpty = 'Address is required.';
  static const String kAddressLengthValidation =
      'Please enter address at least 4 characters.';

  static const String kStartingAddressIsEmpty = 'Starting address is required.';
  static const String kStartingAddressLengthValidation =
      'Please enter starting address at least 4 characters.';

  static const String kDestinationAddressIsEmpty =
      'Destination address is required.';
  static const String kDestinationAddressLengthValidation =
      'Please enter destination address at least 4 characters.';

  static const String kPickedAddressIsEmpty = 'Picked address is required.';
  static const String kPickedAddressLengthValidation =
      'Please enter picked address at least 4 characters.';

  static const String kDropAddressIsEmpty = 'Drop address is required.';
  static const String kDropAddressLengthValidation =
      'Please enter drop address at least 4 characters.';

  // Age
  static const String kAgeIsEmpty = 'Age is required.';
  static const String kAgeValueValidation =
      'Age should not be 0 or more then 100.';

  // Medicine Name
  static const String kMedicineNameIsEmpty = 'Please enter medicine name.';
  static const String kMedicineNameLengthValidation =
      // ignore: lines_longer_than_80_chars
      'Please enter medicine name at least 3 characters and not more than 50 characters.';

  // Medicine Dosage
  static const String kMedicineDosageIsEmpty = 'Please enter medicine dosage.';
  static const String kInvalidMedicineDosage =
      'Please enter valid medicine dosage.';

  // Date
  static const String kDateIsEmpty = 'Date is required.';

  //payment
  static const String kEnterPayment = 'Enter Payment';
  static const String kPaymentIsEmpty = 'Please enter received OTP.';
  static const String kPaymentInvalid = 'Please enter valid OTP.';

  //users validation
  static const String kFirstName = 'Enter first Name';
  static const String kLastName = 'Enter last Name';
  static const String kFirstNameIsEmpty = 'Please enter your first name.';
  static const String kMiddleNameIsEmpty = 'Please enter your middle name.';
  static const String kBirthdateIsEmpty = 'Enter birthdate';

  static const String kTitleIsEmpty = 'Enter Title';
  static const String kTopicIsEmpty = 'Enter Topic';
  static const String kAgendaIsEmpty = 'Enter Agenda';
  static const String kCommentIsEmpty = 'Please enter comment';
  static const String kDescriptionIsEmpty = 'Enter Description';
  static const String kDescriptionLengthValidation =
      'Please enter Description at least 4 characters.';

  static const String kDurationIsEmpty = 'Enter Duration';
  static const String kInvalidDuration = 'Please enter valid duration.';

  static const String kLocationIsEmpty = 'Please enter your last name.';

  // National Insurance Number

  static const String kNationalInsuranceNumberEmpty =
      "National insurance number is required.";

  // City

  static const String kCityEmpty = "City is required.";

  static const String kFullNameIsEmpty = 'Please enter your full name.';
  static const String kExpiryDateIsEmpty = 'Please enter expiry date.';

  static const String kEnterCode = 'Please enter the code.';
}

class ValidationUtils {
  static String? validatePassword(
    String? value, {
    bool isPasswordNotMatching = false,
  }) {
    final String password = value?.trim() ?? '';
    if (password.isEmpty) {
      return ValidationMSG.kPasswordIsEmpty;
    } else if (password.length < 6) {
      return ValidationMSG.kPasswordLengthValidation;
    } else if (isPasswordNotMatching) {
      return ValidationMSG.kPasswordNotMatching;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value, {
    bool isPasswordNotMatching = false,
  }) {
    final String password = value?.trim() ?? '';
    if (isPasswordNotMatching) {
      return ValidationMSG.kPasswordNotMatching;
    } else if (password.isEmpty) {
      return ValidationMSG.kConfirmPasswordIsEmpty;
    }
    return null;
  }

  static String? validateSchoolName(String? value) {
    final String name = value?.trim() ?? '';
    if (name.isEmpty) {
      return ValidationMSG.kSchoolNameIsEmpty;
    } else if (name.length < 3 || name.length > 50) {
      return ValidationMSG.kSchoolNameLengthValidation;
    }
    return null;
  }

  static String? validateUserName(String? value) {
    final String userName = value?.trim() ?? '';
    if (userName.isEmpty) {
      return ValidationMSG.kUserNameIsEmpty;
    }
    return null;
  }

  static String? validateAddress(String? value) {
    final String address = value?.trim() ?? '';
    if (address.isEmpty) {
      return ValidationMSG.kAddressIsEmpty;
    } else if (address.length < 1) {
      return ValidationMSG.kAddressLengthValidation;
    }
    return null;
  }

  static String? validateMessage(String? value) {
    final String address = value?.trim() ?? '';
    if (address.isEmpty) {
      return ValidationMSG.kMessageIsEmpty;
    } else if (address.length < 1) {
      return ValidationMSG.kMessageLengthValidation;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final RegExp regExp = RegExp(pattern);
    final String email = value?.trim() ?? '';
    if (email.isEmpty) {
      return ValidationMSG.kEmailIsEmpty;
    } else if (!regExp.hasMatch(email)) {
      return ValidationMSG.kInvalidEmail;
    }
    return null;
  }

  static String? validateMobile(String? value) {
    const String pattern =
        r'^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$';
    final RegExp regExp = RegExp(pattern);
    final String phoneNumber = value?.trim().replaceAll(' ', '') ?? '';
    if (phoneNumber.isEmpty) {
      return ValidationMSG.kPhoneNumberIsEmpty;
    }
    //  else if (!regExp.hasMatch(phoneNumber)) {
    //   return ValidationMSG.kInvalidMobile;
    // }
    return null;
  }

  static String? validateMobileWithoutCountryCode(String? value) {
    const String pattern = r'^(\+\d{1,3}[- ]?)?\d{10}$';
    final RegExp regExp = RegExp(pattern);
    final String phoneNumber = value?.trim().replaceAll(' ', '') ?? '';
    if (phoneNumber.isEmpty) {
      return ValidationMSG.kPhoneNumberIsEmpty;
    } else if (!regExp.hasMatch(phoneNumber)) {
      return ValidationMSG.kInvalidMobile;
    }
    return null;
  }

  static String? validateUSAMobile(String? value) {
    const String pattern = r'^(\([0-9]{3}\)|[0-9]{3}-)[0-9]{3}-[0-9]{4}$';
    final RegExp regExp = RegExp(pattern);
    final String phoneNumber = value?.trim().replaceAll(' ', '') ?? '';
    if (phoneNumber.isEmpty) {
      return ValidationMSG.kPhoneNumberIsEmpty;
    }
    // else if (!regExp.hasMatch(phoneNumber)) {
    //   return ValidationMSG.kInvalidMobile;
    // }
    return null;
  }

  static String? validateOTP(String? value) {
    const String pattern = r'(^[0-9]{6}$)';
    final RegExp regExp = RegExp(pattern);
    final String otp = value?.trim().replaceAll(' ', '') ?? '';
    if (otp.isEmpty) {
      return ValidationMSG.kOtpIsEmpty;
    } else if (otp.length > 6) {
      return ValidationMSG.kInvalidOTP;
    } else if (!regExp.hasMatch(otp)) {
      return ValidationMSG.kInvalidOTP;
    }
    return null;
  }

  static String? validatePincode(String? value) {
    const String pattern = r'(^[0-9]{6}$)';
    final RegExp regExp = RegExp(pattern);
    final String pincodeNo = value?.trim().replaceAll(' ', '') ?? '';
    if (pincodeNo.isEmpty) {
      return null;
    } else if (pincodeNo.length > 6) {
      return ValidationMSG.kInvalidPincode;
    } else if (!regExp.hasMatch(pincodeNo)) {
      return ValidationMSG.kInvalidPincode;
    }
    return null;
  }

  static String? validatePSPCode(String? value) {
    final String pincodeNo = value?.trim().replaceAll(' ', '') ?? '';
    if (pincodeNo.isEmpty) {
      return ValidationMSG.kPSPCodeIsEmpty;
      // } else if (pincodeNo.length > 6) {
      //   return ValidationMSG.kInvalidPSPcode;
    }
    return null;
  }

  static String? validatePayment(String? value) {
    const String pattern = r'(^[0-9]{4}$)';
    final RegExp regExp = RegExp(pattern);
    final String payment = value?.trim().replaceAll(' ', '') ?? '';
    if (payment.isEmpty) {
      return ValidationMSG.kPaymentIsEmpty;
    } else if (payment.length > 4) {
      return ValidationMSG.kPaymentInvalid;
    } else if (!regExp.hasMatch(payment)) {
      return ValidationMSG.kPaymentInvalid;
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    final String firstName = value?.trim() ?? '';
    if (firstName.isEmpty) {
      return ValidationMSG.kFirstNameIsEmpty;
    }
    return null;
  }

  static String? validateLastName(String? value) {
    final String lastName = value?.trim() ?? '';
    if (lastName.isEmpty) {
      return ValidationMSG.kLastNameIsEmpty;
    }
    return null;
  }

  static String? validateMiddleName(String? value) {
    final String middleName = value?.trim() ?? '';
    if (middleName.isEmpty) {
      return ValidationMSG.kMiddleNameIsEmpty;
    }
    return null;
  }

  static String? validateBirthdateName(String? value) {
    final String birthdate = value?.trim() ?? '';
    if (birthdate.isEmpty) {
      return ValidationMSG.kBirthdateIsEmpty;
    }
    return null;
  }

  static String? validateTitle(String? value) {
    final String title = value?.trim() ?? '';
    if (title.isEmpty) {
      return ValidationMSG.kTitleIsEmpty;
    }
    return null;
  }

  static String? validateDescription(String? value) {
    final String description = value?.trim() ?? '';
    if (description.isEmpty) {
      return ValidationMSG.kDescriptionIsEmpty;
    } else if (description.length < 4) {
      return ValidationMSG.kDescriptionLengthValidation;
    }
    return null;
  }

  static String? validateDuration(String? value) {
    final String duration = value?.trim() ?? '';
    if (duration.isEmpty) {
      return ValidationMSG.kDescriptionIsEmpty;
    } else if (duration.length > 10) {
      return ValidationMSG.kInvalidDuration;
    }
    return null;
  }

  static String? validateLocation(String? value) {
    final String location = value?.trim() ?? '';
    if (location.isEmpty) {
      return ValidationMSG.kLocationIsEmpty;
    }
    return null;
  }

  static String? validateSendMessage(String? value) {
    final String address = value?.trim() ?? '';
    if (address.isEmpty) {
      return ValidationMSG.kMessageIsEmpty;
    }
    return null;
  }

  static String? validateTopic(String? value) {
    final String title = value?.trim() ?? '';
    if (title.isEmpty) {
      return ValidationMSG.kTopicIsEmpty;
    }
    return null;
  }

  static String? validateAgenda(String? value) {
    final String title = value?.trim() ?? '';
    if (title.isEmpty) {
      return ValidationMSG.kAgendaIsEmpty;
    }
    return null;
  }

  static String? validateComment(String? value) {
    final String comment = value?.trim() ?? '';
    if (comment.isEmpty) {
      return ValidationMSG.kCommentIsEmpty;
    }
    return null;
  }

  static String? validateSearchInstitute(String? value) {
    final String institute = value?.trim() ?? '';
    if (institute.isEmpty) {
      return ValidationMSG.kInstituteIsEmpty;
    }
    return null;
  }

  static String? validateNationalInsuranceNumber(String? value) {
    final String institute = value?.trim() ?? '';
    if (institute.isEmpty) {
      return ValidationMSG.kNationalInsuranceNumberEmpty;
    }
    return null;
  }

  static String? validateCity(String? value) {
    final String institute = value?.trim() ?? '';
    if (institute.isEmpty) {
      return ValidationMSG.kCityEmpty;
    }
    return null;
  }

  static String? validateFullName(String? value) {
    final String fullName = value?.trim() ?? '';
    if (fullName.isEmpty) {
      return ValidationMSG.kFullNameIsEmpty;
    }
    return null;
  }

  static String? validateExpiryDate(String? value) {
    final String expDate = value?.trim() ?? '';
    if (expDate.isEmpty) {
      return ValidationMSG.kFirstNameIsEmpty;
    }
    return null;
  }

  static String? validateCode(String? value) {
    final String expDate = value?.trim() ?? '';
    if (expDate.isEmpty) {
      return ValidationMSG.kEnterCode;
    }
    return null;
  }
}
