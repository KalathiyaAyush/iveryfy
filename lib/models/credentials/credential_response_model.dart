// ignore_for_file: constant_identifier_names

import 'dart:ui';

enum CredentialState {
  COMPLETED,
  APPROVED,
  ONGOING,
  EXPIRED,
}

extension CredentialStateProperties on CredentialState {
  Color get color {
    switch (this) {
      case CredentialState.COMPLETED:
        return const Color(0xff22B07D);
      case CredentialState.APPROVED:
        return const Color(0xff22B07D);
      case CredentialState.EXPIRED:
        return const Color(0xff0087FF);
      case CredentialState.ONGOING:
        return const Color(0xffFBBB3F);
    }
  }
}

//** Moedel */

class CredentialsListModel {
  int? status;
  CredentialData? data;
  bool? hasError;
  String? message;

  CredentialsListModel({this.status, this.data, this.hasError, this.message});

  CredentialsListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? CredentialData.fromJson(json['data']) : null;
    hasError = json['hasError'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['hasError'] = hasError;
    data['message'] = message;
    return data;
  }
}

class CredentialData {
  List<Credential>? credential;

  CredentialData({this.credential});

  CredentialData.fromJson(Map<String, dynamic> json) {
    if (json['credential'] != null) {
      credential = <Credential>[];
      json['credential'].forEach((v) {
        credential!.add(Credential.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (credential != null) {
      data['credential'] = credential!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Credential {
  String? id;
  String? state;
  String? applicantId;
  String? verifiersName;
  Transections? transections;
  CreationDate? creationDate;
  String? documentType;
  String? sessionId;
  String? verifiersId;
  int? createdDateTimestamp;
  String? providerUrl;
  bool selected = false;

  Credential({
    this.id,
    this.state,
    this.applicantId,
    this.verifiersName,
    this.transections,
    this.creationDate,
    this.documentType,
    this.sessionId,
    this.verifiersId,
    this.createdDateTimestamp,
    this.providerUrl,
  });

  Credential.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    applicantId = json['applicant_id'];
    verifiersName = json['verifiers_name'];
    transections = json['transections'] != null
        ? Transections.fromJson(json['transections'])
        : null;
    creationDate = json['creation_date'] != null
        ? CreationDate.fromJson(json['creation_date'])
        : null;
    documentType = json['document_type'];
    sessionId = json['session_id'];
    verifiersId = json['verifiers_id'];
    createdDateTimestamp = json['created_date_timestamp'];
    providerUrl = json['provider_url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['applicant_id'] = applicantId;
    data['verifiers_name'] = verifiersName;
    if (transections != null) {
      data['transections'] = transections!.toJson();
    }
    if (creationDate != null) {
      data['creation_date'] = creationDate!.toJson();
    }
    data['document_type'] = documentType;
    data['session_id'] = sessionId;
    data['verifiers_id'] = verifiersId;
    data['created_date_timestamp'] = createdDateTimestamp;
    data['provider_url'] = providerUrl;
    data['id'] = id;

    return data;
  }
}

class Transections {
  String? url;
  String? txId;

  Transections({this.url, this.txId});

  Transections.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    txId = json['txId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['txId'] = txId;
    return data;
  }
}

class CreationDate {
  int? iSeconds;
  int? iNanoseconds;

  CreationDate({this.iSeconds, this.iNanoseconds});

  CreationDate.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}
