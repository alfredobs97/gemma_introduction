import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:groq/groq.dart';

class GroqService {
  final Groq _gemma;

  GroqService() : _gemma = Groq(apiKey: dotenv.env['GROQ_API_KEY']!, model: GroqModel.gemma2_9b_it);

  Future<void> init() async {
    _gemma.startChat();
  }

  Future<String?> generateContent(String prompt) async {
    try {
      final GroqResponse response = await _gemma.sendMessage(prompt);

      return response.choices.first.message.content;
    } on GroqException catch (error) {
      debugPrint('GroqException: ${error.message}');
      return null;
    } catch (e) {
      debugPrint('Exception: ${e.toString()}');
      return null;
    }
  }
}
