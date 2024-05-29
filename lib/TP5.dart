import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Language Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelector(),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String selectedLanguage = 'Java';

  void onChanged(String newValue) {
    setState(() {
      selectedLanguage = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming Language Selector'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select your preferred programming language:',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              DropdownButton<String>(
                value: selectedLanguage,
                onChanged: onChanged,
                items: <String>['Java', 'JavaScript', 'Dart', 'Python', 'C#', 'C++']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'You selected: $selectedLanguage',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



using listview 

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Language Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageSelector(),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String selectedLanguage = 'Java';
  List<String> languages = ['Java', 'JavaScript', 'Dart', 'Python', 'C#', 'C++'];

  void onChanged(String newValue) {
    setState(() {
      selectedLanguage = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programming Language Selector'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select your preferred programming language:',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 200.0, // Set a fixed height for ListView
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    return ListTile(
                      title: Text(language),
                      onTap: () {
                        onChanged(language);
                      },
                      selected: selectedLanguage == language,
                      selectedTileColor: Colors.blue.withOpacity(0.5),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'You selected: $selectedLanguage',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
