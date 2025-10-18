import 'package:flutter/material.dart';
import '../database/notes_database.dart';

class NoteEditScreen extends StatefulWidget {
  final Map<String, dynamic>? note;
  const NoteEditScreen({super.key, this.note});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final colorController = TextEditingController(text: '0xFFFFFFFF');

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!['title'];
      descriptionController.text = widget.note!['description'];
      colorController.text = widget.note!['color'];
    }
  }

  void saveNote() async {
    if (!_formKey.currentState!.validate()) return;

    final title = titleController.text;
    final description = descriptionController.text;
    final color = colorController.text;
    final date = DateTime.now().toIso8601String();

    if (widget.note == null) {
      // Create new note
      await NotesDatabase.instance.addNote(title, description, date, color);
    } else {
      // Update existing note
      await NotesDatabase.instance.updateNote(
        widget.note!['id'],
        title,
        description,
        date,
        color,
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) => value!.isEmpty ? 'Enter title' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value!.isEmpty ? 'Enter description' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: colorController,
                decoration: const InputDecoration(
                  labelText: 'Color (e.g., 0xFFB74093)',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: saveNote, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
