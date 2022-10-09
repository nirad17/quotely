import 'package:flutter/foundation.dart';
import 'quote.dart';
class TaskData extends ChangeNotifier {
  List<Quote> quotes=[];
  void deleteQuote(String id) {
    
  }
  void deleteQuotes() {
    if (quotes.isNotEmpty) {
      quotes.clear();
    }
  }
}