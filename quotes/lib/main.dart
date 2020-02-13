import 'package:flutter/material.dart';
import 'quote.dart';
import 'quotes_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Stephanie Piro', text: 'Behind every successful woman is a substantial amount of coffee.'),
    Quote(author: 'Josh Billings', text: 'Never work before breakfast; if you have to work before breakfast, eat your breakfast first.'),
    Quote(author: 'Zooey Deschanel', text: 'In an ideal world no one would talk before 10am. People would just hug, because waking up is really hard.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),
      ),
    );
  }
}

