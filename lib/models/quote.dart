class Quote {
  String? id;
  String? content;
  String? author;
  bool isFav;
  Quote({this.id, this.isFav=true});
  void toggle() {
    isFav!=isFav;
  }

}