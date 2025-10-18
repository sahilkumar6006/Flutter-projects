import 'package:first_app/model/meme_model.dart';
import 'package:first_app/services/meme_services.dart';
import 'package:first_app/widget/meme_card.dart';
import 'package:flutter/material.dart';

class MemeHomePage extends StatefulWidget {
  const MemeHomePage({super.key});

  @override
  State<MemeHomePage> createState() => _MemeHomePageState();
}

class _MemeHomePageState extends State<MemeHomePage> {
  List<Meme> memes = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadMemes();
  }

  Future<void> _loadMemes() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final fetchedMemes = await MemeServices.fetchMemes();
      if (fetchedMemes != null) {
        setState(() {
          memes = fetchedMemes;
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Failed to load memes';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meme App'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadMemes),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          ),
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : error != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.white),
                    const SizedBox(height: 16),
                    Text(
                      error!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadMemes,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              )
            : memes.isEmpty
            ? const Center(
                child: Text(
                  'No memes available',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: memes.length,
                itemBuilder: (context, index) {
                  return MemeCard(meme: memes[index]);
                },
              ),
      ),
    );
  }
}
