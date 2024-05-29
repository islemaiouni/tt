import 'package:flutter/material.dart';

void main() => runApp(ProductReviewApp());

class ProductReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Review',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductReviewPage(),
    );
  }
}

class ProductReviewPage extends StatefulWidget {
  @override
  _ProductReviewPageState createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  TextEditingController commentController = TextEditingController();
  int rating = 0;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Product Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Comment (20-60 characters) *'),
              maxLines: 3,
            ),
            SizedBox(height: 10.0),
            Text(
              errorMessage,
              style: TextStyle(
                color: errorMessage.contains('Thank you') ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                validateAndSubmit();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void validateAndSubmit() {
    final comment = commentController.text;

    if (comment.isEmpty || rating == 0) {
      setState(() {
        errorMessage = 'Comment and rating are required';
      });
      return;
    }

    if (comment.length < 20 || comment.length > 60) {
      setState(() {
        errorMessage = 'Comment must be between 20 and 60 characters';
      });
      return;
    }

    setState(() {
      errorMessage = 'Thank you for giving your review';
    });
  }
}
