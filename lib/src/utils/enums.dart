import 'package:intl/intl.dart';

enum PickerActionType {
  camera,
  library,
  video,
  document,
}

enum YotiDocType {
  passport,
  driving,
  address,
  rightToWork;
}

enum NotificationType {
  approved,
  pending,
}

extension NotificationTypeExt on NotificationType {
  String get keyType {
    switch (this) {
      case NotificationType.approved:
        return 'APPROVED';
      case NotificationType.pending:
        return 'PENDING';
    }
  }
}

extension YotiDocTypeExt on YotiDocType {
  String get keyType {
    switch (this) {
      case YotiDocType.passport:
        return 'PASSPORT';
      case YotiDocType.driving:
        return 'DRIVING_LICENCE';
      case YotiDocType.address:
        return 'PROOF_OF_ADDRESS';
      case YotiDocType.rightToWork:
        return 'RIGHT_TO_WORK';
    }
  }
}

enum ExpiryDateOptions {
  noExpiry,
  oneWeek,
  oneMonth,
  sixMonth,
  oneYear,
  enterManually,
}

extension ExpiryDateOptionsProperties on ExpiryDateOptions {
  DateTime get getDate {
    switch (this) {
      case ExpiryDateOptions.noExpiry:
        return DateTime.now().add(const Duration(days: 730));
      case ExpiryDateOptions.oneWeek:
        return DateTime.now().add(const Duration(days: 7));
      case ExpiryDateOptions.oneMonth:
        return DateTime.now().add(const Duration(days: 30));
      case ExpiryDateOptions.sixMonth:
        return DateTime.now().add(const Duration(days: 182));
      case ExpiryDateOptions.oneYear:
        return DateTime.now().add(const Duration(days: 365));
      case ExpiryDateOptions.enterManually:
        return DateTime.now();
    }
  }

  String get getDisplyString {
    switch (this) {
      case ExpiryDateOptions.noExpiry:
        return "No expiry date, skip this step";
      case ExpiryDateOptions.oneWeek:
        return "1 Week - Expires on ${DateFormat("dd MMM yyyy").format(DateTime.now().add(const Duration(days: 7)))}";
      case ExpiryDateOptions.oneMonth:
        return "1 Month - Expires on ${DateFormat("dd MMM yyyy").format(DateTime.now().add(const Duration(days: 30)))}";
      case ExpiryDateOptions.sixMonth:
        return "6 Months - Expires on ${DateFormat("dd MMM yyyy").format(DateTime.now().add(const Duration(days: 182)))}";
      case ExpiryDateOptions.oneYear:
        return "1 Year - Expires on ${DateFormat("dd MMM yyyy").format(DateTime.now().add(const Duration(days: 364)))}";
      case ExpiryDateOptions.enterManually:
        return "Enter expiry date manually";
    }
  }
}
