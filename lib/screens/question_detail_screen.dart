import 'package:flutter/material.dart';

import '../models/question.dart';

class QuestionDetailScreen extends StatefulWidget {
  final Question question; // passed through the constructor

  const QuestionDetailScreen({super.key, required this.question});

  @override
  State<QuestionDetailScreen> createState() => _QuestionDetailScreenState();
}

class _QuestionDetailScreenState extends State<QuestionDetailScreen> {
  int? _selectedIndex;
  bool _checked = false;

  bool get _isCorrect => _selectedIndex == widget.question.correctIndex;

  void _check() {
    if (_selectedIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pick an answer first.')),
      );
      return;
    }
    setState(() => _checked = true);
  }

  Color? _optionColor(int i) {
    if (!_checked) {
      return i == _selectedIndex ? Colors.grey.shade300 : null;
    }
    if (i == widget.question.correctIndex) {
      return Colors.green.shade100;
    } else if (i == _selectedIndex) {
      return Colors.red.shade100;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.question;

    return Scaffold(
      appBar: AppBar(
        title: Text(q.difficulty.label, style: const TextStyle(fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (q.passage.isNotEmpty)
            Card(
              color: Colors.grey.shade100,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(q.passage, style: const TextStyle(height: 1.4)),
              ),
            ),
          const SizedBox(height: 12),
          Text(q.prompt, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          for (int i = 0; i < q.options.length; i++)
            Card(
              color: _optionColor(i),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 14,
                  child: Text(String.fromCharCode(65 + i)),
                ),
                title: Text(q.options[i]),
                onTap: _checked ? null : () => setState(() => _selectedIndex = i),
              ),
            ),
          const SizedBox(height: 12),
          if (!_checked)
            FilledButton(onPressed: _check, child: const Text('Check answer'))
          else ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isCorrect ? Colors.green.shade50 : Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _isCorrect
                        ? 'Correct!'
                        : 'Not quite. The answer is '
                            '${String.fromCharCode(65 + q.correctIndex)}.',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(q.explanation),
                ],
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              // Send the result back to the list screen.
              onPressed: () => Navigator.pop(context, _isCorrect),
              child: const Text('Done'),
            ),
          ],
        ],
      ),
    );
  }
}
