import 'package:flutter/material.dart';
import 'package:gemma_introduction/services/groq_service.dart';
import 'package:gemma_introduction/ui/model_response_widget.dart';

class TalkWithGemmaPage extends StatefulWidget {
  const TalkWithGemmaPage({super.key});

  @override
  State<TalkWithGemmaPage> createState() => _TalkWithGemmaPageState();
}

class _TalkWithGemmaPageState extends State<TalkWithGemmaPage> {
  final groqSevice = GroqService();
  final textController = TextEditingController();

  Future<String?> _modelSingleResponse = Future.value(null);

  @override
  void initState() {
    super.initState();
    groqSevice.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/gemma.webp', cacheHeight: 100, height: 100),
              ),
              Text(
                "Ask Gemma anything!",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 4,
                controller: textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Type your question here...',
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _modelSingleResponse = groqSevice.generateContent(textController.text);
                  FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Ask Gemma"),
              ),
              const SizedBox(height: 24),
              FutureBuilder(
                future: _modelSingleResponse,
                builder: (context, snapshot) => switch (snapshot.connectionState) {
                  ConnectionState.waiting => const Center(child: CircularProgressIndicator()),
                  _ => _buildSingleResponseWidget(snapshot),
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleResponseWidget(AsyncSnapshot<String?> snapshot) {
    if (snapshot.hasError) return const Text('Something went wrong');

    if (snapshot.data == null) return const SizedBox.shrink();

    return ModelResponseWidget(text: snapshot.data!);
  }
}
