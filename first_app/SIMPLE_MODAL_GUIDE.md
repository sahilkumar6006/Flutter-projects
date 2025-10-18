# Simple Modal Guide for Flutter

## Quick Start - Using Modals

### 1. Basic Alert Dialog
```dart
// Simple alert
ModalUtils.showSimpleAlert(context, 'Title', 'Message');

// Example usage
ModalUtils.showSimpleAlert(context, 'Hello!', 'This is a simple alert.');
```

### 2. Confirmation Dialog
```dart
// Confirmation with callback
ModalUtils.showConfirmation(
  context,
  'Delete Item',
  'Are you sure?',
  () {
    // Action to perform when confirmed
    print('User confirmed!');
  },
);
```

### 3. Success/Error Dialogs
```dart
// Success dialog
ModalUtils.showSuccess(context, 'Operation completed!');

// Error dialog
ModalUtils.showError(context, 'Something went wrong!');
```

### 4. Loading Dialog
```dart
// Show loading
ModalUtils.showLoading(context, 'Loading...');

// Hide loading (after some work)
ModalUtils.hideLoading(context);
```

### 5. Bottom Sheet
```dart
// Simple bottom sheet
ModalUtils.showBottomSheet(
  context,
  Text('Your content here'),
);
```

## Files Created

1. **`lib/widget/basic_modal.dart`** - Simple modal examples with buttons
2. **`lib/utils/modal_utils.dart`** - Utility functions for easy modal usage
3. **`lib/widget/modal_usage_example.dart`** - Examples of using the utility functions

## How to Use

### Option 1: Use the Basic Modal Widget
```dart
// In your main.dart
import 'widget/basic_modal.dart';

// Set as home
home: const BasicModal(),
```

### Option 2: Use ModalUtils Anywhere
```dart
// Import the utils
import 'utils/modal_utils.dart';

// Use in any widget
ElevatedButton(
  onPressed: () => ModalUtils.showSimpleAlert(
    context, 
    'Hello', 
    'This is easy!'
  ),
  child: Text('Show Alert'),
)
```

### Option 3: Custom Modal
```dart
// Create your own modal
void _showMyModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('My Modal'),
      content: Text('Custom content'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  );
}
```

## Run the App

1. Run `flutter run` in your terminal
2. You'll see the Basic Modal screen with different modal examples
3. Tap each button to see different modal types

## Key Points

- **ModalUtils** makes it super easy to show common modals
- **showDialog()** for custom modals
- **showModalBottomSheet()** for bottom sheets
- Always use `Navigator.pop(context)` to close modals
- Check `context.mounted` before using context in async operations

## Common Modal Types

1. **Alert Dialog** - Simple messages
2. **Confirmation Dialog** - Yes/No questions
3. **Loading Dialog** - Show progress
4. **Bottom Sheet** - Slide up from bottom
5. **Custom Dialog** - Fully customizable

That's it! You now have simple, reusable modal functions for your Flutter app.
