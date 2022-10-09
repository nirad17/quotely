import 'package:flutter/material.dart';
import 'package:quotely/widgets/quote_card.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            QuoteCard(content: "I'm Nirad yeola",author: "Nirad", tags: ["famous"],),
            QuoteCard(content: "I'm Nirad yeola",author: "Nirad", tags: ["famous"],),
          ],)),
    );
  }
}