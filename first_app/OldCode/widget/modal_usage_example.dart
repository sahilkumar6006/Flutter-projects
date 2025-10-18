import 'package:flutter/material.dart';
import '../utils/modal_utils.dart';

class ModalUsageExample extends StatelessWidget {
  const ModalUsageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Usage Examples'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Easy Modal Functions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Simple Alert
            ElevatedButton(
              onPressed: () => ModalUtils.showSimpleAlert(
                context,
                'Hello!',
                'This is a simple alert using ModalUtils.',
              ),
              child: const Text('Simple Alert'),
            ),
            const SizedBox(height: 10),

            // Confirmation
            ElevatedButton(
              onPressed: () => ModalUtils.showConfirmation(
                context,
                'Delete Item',
                'Are you sure you want to delete this item?',
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Item deleted!')),
                  );
                },
              ),
              child: const Text('Confirmation Dialog'),
            ),
            const SizedBox(height: 10),

            // Success Dialog
            ElevatedButton(
              onPressed: () => ModalUtils.showSuccess(
                context,
                'Your action was completed successfully!',
              ),
              child: const Text('Success Dialog'),
            ),
            const SizedBox(height: 10),

            // Error Dialog
            ElevatedButton(
              onPressed: () => ModalUtils.showError(
                context,
                'Something went wrong. Please try again.',
              ),
              child: const Text('Error Dialog'),
            ),
            const SizedBox(height: 10),

            // Loading Dialog
            ElevatedButton(
              onPressed: () => _showLoadingExample(context),
              child: const Text('Loading Dialog'),
            ),
            const SizedBox(height: 10),

            // Bottom Sheet
            ElevatedButton(
              onPressed: () => ModalUtils.showBottomSheet(
                context,
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bottom Sheet Content',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('This is content in a bottom sheet.'),
                    SizedBox(height: 20),
                    Text('You can put any widget here!'),
                  ],
                ),
              ),
              child: const Text('Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoadingExample(BuildContext context) {
    // Show loading
    ModalUtils.showLoading(context, 'Loading...');

    // Simulate some work
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        ModalUtils.hideLoading(context);
        ModalUtils.showSuccess(context, 'Loading completed!');
      }
    });
  }
}
