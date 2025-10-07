class FrequentQuestion {
  final String id;
  final String question;
  final String answer;

  FrequentQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });
}

class HelpCenterData {
  final String id;
  final List<FrequentQuestion> frequentQuestions;
  final String searchQuery;

  HelpCenterData({
    required this.id,
    required this.frequentQuestions,
    this.searchQuery = '',
  });
}

