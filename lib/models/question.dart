enum Difficulty { easy, medium, hard }

extension DifficultyLabel on Difficulty {
  String get label => name[0].toUpperCase() + name.substring(1);
}

class Question {
  final String id;
  final String category;
  final Difficulty difficulty;
  final String passage;
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const Question({
    required this.id,
    required this.category,
    required this.difficulty,
    required this.passage,
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class StudyPlan {
  final String title;
  final String subtitle;
  final String category;
  final Difficulty difficulty;

  const StudyPlan({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.difficulty,
  });
}
