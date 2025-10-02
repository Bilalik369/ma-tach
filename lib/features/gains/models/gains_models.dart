enum GainStatus {
  received,
  upcoming,
}

class GainData {
  final String id;
  final double amount;
  final String campaign;
  final String date;
  final GainStatus status;

  GainData({
    required this.id,
    required this.amount,
    required this.campaign,
    required this.date,
    required this.status,
  });
}

class UpcomingGain {
  final String id;
  final double amount;
  final String campaign;
  final String dueDate;

  UpcomingGain({
    required this.id,
    required this.amount,
    required this.campaign,
    required this.dueDate,
  });
}
