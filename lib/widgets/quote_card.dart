import 'package:flutter/material.dart';
import 'package:quotely/models/quote.dart';
import 'package:quotely/widgets/topic_box.dart';

class QuoteCard extends StatefulWidget {
  final String author;
  final String content;
  final List<dynamic>? tags;
  final Quote? quote;
  QuoteCard({required this.author, required this.content,  this.tags, this.quote});
  

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopicBox(tag: widget.tags?[0]),
                  // TopicBox(tag: widget.tags?[1]),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            children: ['Delete', 'Update']
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      // FirestoreMethods().deletePost(widget.snap['postId']);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
              Text(
                '"${widget.content}"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.author,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.33),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            )
          ],
        ),
      ),
    );
  }
}
