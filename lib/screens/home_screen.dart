import 'package:flutter/material.dart';
import 'question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAT R&W Practice'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back!',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Select a module to start practicing:'),
            const SizedBox(height: 24),
            Card(
              color: theme.colorScheme.primary.withOpacity(0.1),
              elevation: 0,
              child: ListTile(
                leading: Icon(Icons.menu_book, color: theme.colorScheme.primary),
                title: const Text('Reading Practice'),
                subtitle: const Text('Craft, Structure, & Information'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionScreen(title: 'Reading Practice'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: theme.colorScheme.secondary.withOpacity(0.1),
              elevation: 0,
              child: ListTile(
                leading: Icon(Icons.edit_note, color: theme.colorScheme.secondary),
                title: const Text('Writing & Language'),
                subtitle: const Text('Standard English Conventions'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionScreen(title: 'Writing & Language'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}