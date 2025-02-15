import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemma_introduction/ui/gemma2_theme.dart';
import 'package:gemma_introduction/ui/talk_with_gemma_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: gemma2Theme(),
      home: const TalkWithGemmaPage(),
    );
  }
}
