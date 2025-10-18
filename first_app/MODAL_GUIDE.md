# Flutter Modal Guide

This guide demonstrates different ways to create modals in Flutter with practical examples.

## Types of Modals in Flutter

### 1. Alert Dialog
The simplest type of modal - shows a message with action buttons.

```dart
void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: const Text('This is a simple alert dialog.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
```

### 2. Bottom Sheet Modal
Slides up from the bottom of the screen.

```dart
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Bottom Sheet Modal'),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}
```

### 3. Custom Dialog
Fully customizable modal with custom styling.

```dart
void _showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.info, size: 50),
              const Text('Custom Dialog'),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
```

### 4. Full Screen Modal
Takes up the entire screen.

```dart
void _showFullScreenModal(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const FullScreenModal(),
      fullscreenDialog: true,
    ),
  );
}
```

### 5. Form Modal
Modal with form inputs and validation.

```dart
void _showFormModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const FormModal();
    },
  );
}
```

### 6. Loading Modal
Shows a loading indicator with optional message.

```dart
void _showLoadingModal(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text('Loading...'),
          ],
        ),
      );
    },
  );
}
```

## Key Properties

### showDialog Properties:
- `context`: BuildContext
- `barrierDismissible`: Whether tapping outside closes the dialog (default: true)
- `barrierColor`: Color of the background overlay
- `builder`: Function that returns the dialog widget

### showModalBottomSheet Properties:
- `context`: BuildContext
- `isScrollControlled`: Allows the sheet to take full height
- `backgroundColor`: Background color of the sheet
- `shape`: Custom shape for the sheet
- `builder`: Function that returns the sheet content

## Best Practices

1. **Always check if context is mounted** before calling Navigator.pop()
2. **Use barrierDismissible: false** for critical actions
3. **Provide clear action buttons** (Cancel/Confirm, OK, etc.)
4. **Handle form validation** in form modals
5. **Use appropriate modal type** for your use case:
   - Alert Dialog: Simple messages
   - Bottom Sheet: Lists, options
   - Custom Dialog: Complex interactions
   - Full Screen: Detailed forms or content

## Navigation

To navigate to the modal examples in your app:
1. Run your Flutter app
2. Tap the floating action button (white + icon)
3. Explore different modal types

## Files Created

- `lib/widget/simple_modal.dart` - Basic modal examples
- `lib/widget/modal_examples.dart` - Comprehensive modal examples
- Updated `lib/screens/meme_home_page.dart` - Added navigation to modals
- Updated `lib/main.dart` - Added import for modal examples

## Testing

Run the app and test each modal type to understand their behavior and use cases.
