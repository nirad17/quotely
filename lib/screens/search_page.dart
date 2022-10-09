import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/quote_card.dart';

class SearchPage extends StatefulWidget {
  final bool isSearchByAuthor;
  SearchPage({Key? key, required this.isSearchByAuthor}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  StreamController _streamController = StreamController();
  late Stream _stream;
  String authorUrl="https://api.quotable.io/random?author=";
  String topicUrl="";
  getQuote() async {
    String url=widget.isSearchByAuthor? authorUrl:topicUrl;
    _streamController.add("waiting");
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      String data = res.body;
      print(jsonDecode(data));
      _streamController.add(jsonDecode(data));
    } else {
      print(" Error!! StatusCode :${res.statusCode}");
    }
  }

  

  void _search() async {
    String url =
        "https://api.quotable.io/search/authors?query=${_searchController.text}";
    print(url);
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      String data = res.body;
      var json_data = jsonDecode(data);
      print(jsonDecode(data));
      String authorSlug = json_data["results"][0]["slug"];
      print(authorSlug);
      authorUrl="https://api.quotable.io/random?author=$authorSlug";
      getQuote();
    }
  }
  @override
  void initState() {
    super.initState();
    _stream = _streamController.stream;
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TextField(
              style: TextStyle(fontSize: 18),
              onSubmitted: (_) {
                // print(_);
                if (widget.isSearchByAuthor) {
                _search();
                } else {
                  setState(() {
                    topicUrl ="https://api.quotable.io/search/quotes?query=${_searchController.text}&limit=10";
                    
                  });
                  getQuote();
                }
              },
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: widget.isSearchByAuthor
                      ? "Search By Author"
                      : "Search By Query",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: Icon(Icons.close))),
            )),
        body: Center(
          child: StreamBuilder(
            stream: _stream,
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == "waiting") {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return Text("Quotely");
              }
              return widget.isSearchByAuthor
                  ? QuoteCard(
                      author: snapshot.data["author"],
                      content: snapshot.data["content"],
                      tags: snapshot.data["tags"],
                    )
                  : ListView.builder(
                      itemCount: snapshot.data['count'],
                      itemBuilder: (context, index) {
                        return QuoteCard(
                            author: snapshot.data["results"][index]["author"],
                            content: snapshot.data["results"][index]["content"],
                            tags: snapshot.data["results"][index]["tags"],
                            );
                      },
                    );
              // return Text(snapshot.data["content"]);
            },
          ),
        ));
  }
}
