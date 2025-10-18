import 'package:flutter/material.dart';

class ModalExamples extends StatelessWidget {
  const ModalExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Examples'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Different Types of Modals in Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 1. Simple Alert Dialog
            ElevatedButton(
              onPressed: () => _showSimpleAlert(context),
              child: const Text('Simple Alert Dialog'),
            ),
            const SizedBox(height: 10),

            // 2. Confirmation Dialog
            ElevatedButton(
              onPressed: () => _showConfirmationDialog(context),
              child: const Text('Confirmation Dialog'),
            ),
            const SizedBox(height: 10),

            // 3. Custom Modal Bottom Sheet
            ElevatedButton(
              onPressed: () => _showCustomBottomSheet(context),
              child: const Text('Custom Bottom Sheet'),
            ),
            const SizedBox(height: 10),

            // 4. Full Screen Modal
            ElevatedButton(
              onPressed: () => _showFullScreenModal(context),
              child: const Text('Full Screen Modal'),
            ),
            const SizedBox(height: 10),

            // 5. Form Modal
            ElevatedButton(
              onPressed: () => _showFormModal(context),
              child: const Text('Form Modal'),
            ),
            const SizedBox(height: 10),

            // 6. Loading Modal
            ElevatedButton(
              onPressed: () => _showLoadingModal(context),
              child: const Text('Loading Modal'),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Simple Alert Dialog
  void _showSimpleAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Simple Alert'),
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

  // 2. Confirmation Dialog
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Action'),
          content: const Text('Are you sure you want to proceed?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Action confirmed!')),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // 3. Custom Modal Bottom Sheet
  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Custom Bottom Sheet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text('${index + 1}'),
                      ),
                      title: Text('Item ${index + 1}'),
                      subtitle: Text('Description for item ${index + 1}'),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected item ${index + 1}')),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 4. Full Screen Modal
  void _showFullScreenModal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FullScreenModal(),
        fullscreenDialog: true,
      ),
    );
  }

  // 5. Form Modal
  void _showFormModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FormModal();
      },
    );
  }

  // 6. Loading Modal
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

    // Simulate loading and close after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Loading completed!')));
      }
    });
  }
}

// Full Screen Modal Widget
class FullScreenModal extends StatelessWidget {
  const FullScreenModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Modal'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fullscreen, size: 100, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              'This is a full screen modal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'It takes up the entire screen and can contain any content.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Form Modal Widget
class FormModal extends StatefulWidget {
  const FormModal({super.key});

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Form Modal'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Form submitted: ${_nameController.text}, ${_emailController.text}',
                  ),
                ),
              );
            }
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
