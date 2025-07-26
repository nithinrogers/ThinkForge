import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _inputController = TextEditingController();
  bool _isLoading = false;
  List<String> _generatedIdeas = [];

  Future<void> _generateIdeas() async {
    if (_inputController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final input = _inputController.text;
    final ideas = await HuggingFaceService.generateIdeas(input);

    setState(() {
      _generatedIdeas = ideas;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThinkForge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a topic or challenge',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _generateIdeas,
              child: _isLoading
                  ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : Text('Generate Ideas'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _generatedIdeas.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_generatedIdeas[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
