import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SudokuApp());
}

class SudokuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SudokuScreen(),
    );
  }
}

class SudokuScreen extends StatefulWidget {
  @override
  _SudokuScreenState createState() => _SudokuScreenState();
}

class _SudokuScreenState extends State<SudokuScreen> {
  // Puzzle and solution grids
  List<List<int>> _puzzle = [];
  List<List<int>> _solution = [];
  
  // Selected cell coordinates
  int _selectedRow = -1;
  int _selectedCol = -1;
  
  // Flag to track completion status
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    _generatePuzzle(); // Initialize puzzle
  }

  // Generate a Sudoku puzzle
  void _generatePuzzle() {
    var rng = Random();
    _solution = List.generate(9, (_) => List.generate(9, (_) => rng.nextInt(9) + 1));
    _puzzle = List.generate(9, (_) => List.generate(9, (_) => 0));
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (rng.nextDouble() < 0.5) {
          _puzzle[i][j] = _solution[i][j];
        }
      }
    }
    // Reset completion status
    _isComplete = false;
    // Reset selected cell
    _selectedRow = -1;
    _selectedCol = -1;
  }

  // Check if Sudoku puzzle is complete
  void _checkComplete() {
    _isComplete = true;
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (_puzzle[i][j] == 0 || _puzzle[i][j] != _solution[i][j]) {
          _isComplete = false;
          return;
        }
      }
    }
  }

  // Select a cell
  void _selectCell(int row, int col) {
    setState(() {
      _selectedRow = row;
      _selectedCol = col;
    });
  }

  // Enter a number into selected cell
  void _enterNumber(int number) {
    if (_selectedRow != -1 && _selectedCol != -1) {
      setState(() {
        _puzzle[_selectedRow][_selectedCol] = number;
        _checkComplete();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 9,
              children: List.generate(81, (index) {
                int row = index ~/ 9;
                int col = index % 9;
                return GestureDetector(
                  onTap: () {
                    _selectCell(row, col);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: _selectedRow == row && _selectedCol == col
                          ? Colors.yellow
                          : Colors.white,
                    ),
                    child: Text(
                      _puzzle[row][col] == 0 ? '' : _puzzle[row][col].toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _puzzle[row][col] == _solution[row][col]
                            ? Colors.green
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 16),
          _isComplete
              ? Text(
                  'Congratulations! You solved the puzzle!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              : SizedBox(),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (int i = 1; i <= 9; i++)
                _buildNumberButton(i),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('New Game'),
            onPressed: () {
              setState(() {
                _generatePuzzle(); // Generate new puzzle
              });
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  // Widget to build number buttons
  Widget _buildNumberButton(int number) {
    return ElevatedButton(
      child: Text(number.toString()),
      onPressed: () {
        _enterNumber(number); // Enter number into selected cell
      },
    );
  }
}
