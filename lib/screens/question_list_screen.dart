import 'package:flutter/material.dart';

import '../data/questions.dart';
import '../models/question.dart';
import 'question_detail_screen.dart';

class QuestionListScreen extends StatefulWidget {
  final String category;
  final Difficulty? initialDifficulty;

  const QuestionListScreen({
    super.key,
    required this.category,
    this.initialDifficulty,
  });

  @override
  State<QuestionListScreen> createState() => _QuestionListScreenState();
}

class _QuestionListScreenState extends State<QuestionListScreen> {
  Difficulty? _selected; // null = All
  late List<Question> _questions;
  int _attempted = 0;
  int _correct = 0;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialDifficulty;
    _questions = allQuestions
        .where((q) => q.category == widget.category)
        .toList();
    _sort();
  }

  void _sort() {
    _questions.sort((a, b) => a.difficulty.index.compareTo(b.difficulty.index));
  }

  List<Question> get _visible {
    if (_selected == null) {
      return _questions;
    }
    return _questions.where((q) => q.difficulty == _selected).toList();
  }

  Color _difficultyColor(Difficulty d) {
    if (d == Difficulty.easy) {
      return Colors.green;
    } else if (d == Difficulty.medium) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  Future<void> _openQuestion(Question q) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => QuestionDetailScreen(question: q)),
    );
    if (!mounted) return;
    if (result != null) {
      setState(() {
        _attempted++;
        if (result) _correct++;
      });
    }
  }

  Future<void> _addQuestion() async {
    final newQuestion = await showDialog<Question>(
      context: context,
      builder: (_) => _AddQuestionDialog(
        category: widget.category,
        difficulty: _selected ?? Difficulty.medium,
      ),
    );
    if (!mounted) return;
    if (newQuestion != null) {
      setState(() {
        _questions.add(newQuestion);
        _sort();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final visible = _visible;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category, style: const TextStyle(fontSize: 20)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addQuestion,
        tooltip: 'Add your own question',
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Difficulty filter chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: _selected == null,
                  onSelected: (_) => setState(() => _selected = null),
                ),
                for (final d in Difficulty.values)
                  ChoiceChip(
                    label: Text(d.label),
                    selected: _selected == d,
                    onSelected: (_) => setState(() => _selected = d),
                  ),
              ],
            ),
          ),

          // Accuracy tracker for this session
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _attempted == 0
                    ? 'No attempts yet this session'
                    : 'Accuracy: $_correct / $_attempted '
                        '(${(_correct * 100 / _attempted).round()}%)',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Divider(),

          Expanded(
            child: visible.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'No questions at this level yet.\nTap + to add one.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: visible.length,
                    itemBuilder: (context, index) {
                      final q = visible[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: _difficultyColor(q.difficulty),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          q.passage.isNotEmpty ? q.passage : q.prompt,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(q.difficulty.label),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => _openQuestion(q),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// Dialog for adding a custom question. Option A is the correct answer.
class _AddQuestionDialog extends StatefulWidget {
  final String category;
  final Difficulty difficulty;

  const _AddQuestionDialog({
    required this.category,
    required this.difficulty,
  });

  @override
  State<_AddQuestionDialog> createState() => _AddQuestionDialogState();
}

class _AddQuestionDialogState extends State<_AddQuestionDialog> {
  final TextEditingController _promptController = TextEditingController();
  final List<TextEditingController> _optionControllers =
      List.generate(4, (_) => TextEditingController());
  String? _error;

  @override
  void dispose() {
    _promptController.dispose();
    for (final c in _optionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    final prompt = _promptController.text.trim();
    final options = _optionControllers.map((c) => c.text.trim()).toList();

    if (prompt.isEmpty || options.any((o) => o.isEmpty)) {
      setState(() => _error = 'Fill in the question and all 4 options.');
      return;
    }

    Navigator.pop(
      context,
      Question(
        id: 'user-${DateTime.now().millisecondsSinceEpoch}',
        category: widget.category,
        difficulty: widget.difficulty,
        passage: '',
        prompt: prompt,
        options: options,
        correctIndex: 0,
        explanation: 'Added by you. Option A was set as the correct answer.',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a question'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            for (int i = 0; i < 4; i++)
              TextField(
                controller: _optionControllers[i],
                decoration: InputDecoration(
                  labelText: i == 0
                      ? 'Option A (correct answer)'
                      : 'Option ${String.fromCharCode(65 + i)}',
                ),
              ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_error!, style: const TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(onPressed: _save, child: const Text('Add')),
      ],
    );
  }
}
