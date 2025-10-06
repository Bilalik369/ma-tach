enum EligibilityStatus {
  oui,
  non,
}

class AdmissibiliteData {
  final String id;
  final EligibilityStatus eligibilityStatus;
  final List<String> uploadedDocuments;
  final String messageComment;

  AdmissibiliteData({
    required this.id,
    required this.eligibilityStatus,
    this.uploadedDocuments = const [],
    this.messageComment = '',
  });
}
