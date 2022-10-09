import 'package:flutter/material.dart';

class TopicBox extends StatelessWidget {
  const TopicBox({required this.tag});
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5,right:5),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color(0xFF023047),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
          ),
    );
  }
}