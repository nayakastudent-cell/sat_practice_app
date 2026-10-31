import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final String title;

  const QuestionScreen({super.key, required this.title});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _selectedOption = -1;

  final List<String> _options = [
    'A. Illustrate a shift in scientific consensus.',
    'B. Highlight a flaw in traditional methodology.',
    'C. Offer an alternative explanation for the findings.',
    'D. Confirm the validity of early historical hypotheses.'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'Researchers examining ancient botanical fossils noted unexpected chemical traces. '
                'These signatures suggest that early plant species adapted to drought far earlier than previously recorded.',
                style: TextStyle(fontSize: 15, height: 1.4),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Which choice best states the main purpose of the text?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedOption == index;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(14.0),
                        side: BorderSide(
                          color: isSelected ? theme.colorScheme.primary : Colors.grey.shade400,
                          width: isSelected ? 2 : 1,
                        ),
                        backgroundColor: isSelected
                            ? theme.colorScheme.primary.withOpacity(0.08)
                            : Colors.white,
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedOption = index;
                        });
                      },
                      child: Text(
                        _options[index],
                        style: TextStyle(
                          color: isSelected ? theme.colorScheme.primary : Colors.black87,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: _selectedOption != -1
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Answer Submitted!')),
                        );
                      }
                    : null,
                child: const Text('Submit Answer', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}