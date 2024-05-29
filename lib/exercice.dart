import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatrice en trois valeurs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController value1Controller = TextEditingController();
  TextEditingController value2Controller = TextEditingController();
  TextEditingController value3Controller = TextEditingController();
  TextEditingController resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice en trois valeurs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: value1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valeur 1'),
            ),
            TextField(
              controller: value2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valeur 2'),
            ),
            TextField(
              controller: value3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valeur 3'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculate();
              },
              child: Text('Calculer'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: resultController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Résultat',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                clearValues();
              },
              child: Text('Effacer'),
            ),
          ],
        ),
      ),
    );
  }

  void calculate() {
    double value1 = double.tryParse(value1Controller.text) ?? 0.0;
    double value2 = double.tryParse(value2Controller.text) ?? 0.0;
    double value3 = double.tryParse(value3Controller.text) ?? 0.0;

    double average = (value1 + value2 + value3) / 3;
    double max = [value1, value2, value3].reduce((a, b) => a > b ? a : b);
    double min = [value1, value2, value3].reduce((a, b) => a < b ? a : b);

    resultController.text =
        'Moyenne: $average\nMax: $max\nMin: $min';
  }

  void clearValues() {
    value1Controller.clear();
    value2Controller.clear();
    value3Controller.clear();
    resultController.clear();
  }
}
