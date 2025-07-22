import 'package:flutter/material.dart';

class SelectCityWidget extends StatefulWidget {
  const SelectCityWidget({super.key});

  @override
  State<SelectCityWidget> createState() => _SelectCityWidgetStateState();
}

class _SelectCityWidgetStateState extends State<SelectCityWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back button
        centerTitle: true,
        title: const Text('Select City'),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'City Name',
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
              color: Colors.blue,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textController.text);
                _textController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
