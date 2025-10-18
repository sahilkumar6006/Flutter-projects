import 'package:flutter/material.dart';
import '../database/notes_database.dart';
import 'note_edit_screen.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    notes = await NotesDatabase.instance.getNotes();
    setState(() {});
  }

  void goToAddNote() async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const NoteEditScreen()));
    refreshNotes();
  }

  void goToEditNote(Map<String, dynamic> note) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => NoteEditScreen(note: note)));
    refreshNotes();
  }

  void deleteNote(int id) async {
    await NotesDatabase.instance.deleteNote(id);
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Notes')),
      body: notes.isEmpty
          ? const Center(child: Text('No notes yet'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  color: Color(int.parse(note['color'])),
                  child: ListTile(
                    title: Text(note['title']),
                    subtitle: Text(note['description']),
                    onTap: () => goToEditNote(note),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteNote(note['id']),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToAddNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
