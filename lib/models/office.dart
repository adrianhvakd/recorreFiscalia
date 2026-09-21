class Office {
  const Office({
    required this.id,
    required this.floor,
    required this.name,
    required this.shortName,
    required this.description,
    required this.questions,
  });

  final int id;
  final int floor;
  final String name;
  final String shortName;
  final String description;
  final List<OfficeQuestion> questions;
}

class OfficeQuestion {
  const OfficeQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  final String question;
  final List<String> options;
  final int correctIndex;

  String get correctAnswer => options[correctIndex];
}
