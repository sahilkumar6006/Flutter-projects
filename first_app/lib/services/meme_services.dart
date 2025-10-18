import 'dart:convert';
import 'package:first_app/model/meme_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MemeServices {
  static const String url = 'https://meme-api.com/gimme/50';

  static Future<List<Meme>?> fetchMemes() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Assuming 'memes' key contains the list
        final memesList = data['memes'] as List<dynamic>;
        return memesList.map((m) => Meme.fromJson(m)).toList();
      } else {
        debugPrint('Failed to fetch memes. Status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching memes: $e');
      return null;
    }
  }
}
