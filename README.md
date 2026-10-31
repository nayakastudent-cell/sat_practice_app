# SAT R&W Practice App (Flutter)

## Setup
1. `flutter create sat_practice_app`
2. Delete the generated `lib/` folder and `test/widget_test.dart` (it references the default MyApp and will fail).
3. Copy this `lib/` folder into the project.
4. `flutter run` from VS Code or Android Studio.

## Structure
- `lib/main.dart` - MaterialApp, theme (Section B)
- `lib/models/question.dart` - Question, StudyPlan, Difficulty
- `lib/data/questions.dart` - sample data (replace with your own content)
- `lib/screens/home_screen.dart` - search TextField + controller + SnackBar (C), category grid, study plans
- `lib/screens/question_list_screen.dart` - StatefulWidget/setState filter chips (D), ListView.builder + add item (E)
- `lib/screens/question_detail_screen.dart` - constructor data passing, if/else feedback, Navigator.pop result (D)

## Suggested commit split (Section F)
- Person 1: "Created home screen layout", "Added search bar with empty-input SnackBar"
- Person 2: "Added question model and sample data", "Created question list screen with difficulty filter"
- Either: "Added question detail screen with answer feedback", "Added add-question dialog"
Each person works on their own branch; run `git pull` before coding.
