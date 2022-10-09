import 'package:flutter/material.dart';
import 'package:quotely/screens/search_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotely'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favourites');
              },
              icon: Icon(Icons.bookmark_added_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(isSearchByAuthor: true),
                  ),
                );
              },
              icon: Icon(Icons.search),
              label: const Text("Search by Author"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Navigator.pushNamed(context, '/search_by_topic');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(isSearchByAuthor: false)));
              },
              icon: Icon(Icons.search),
              label: const Text("Search by topic"),
            ),
          ],
        ),
      ),
    );
  }
}
