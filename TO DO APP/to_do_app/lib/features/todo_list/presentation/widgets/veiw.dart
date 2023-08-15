import 'package:flutter/material.dart';

class ViewList extends StatelessWidget {
  ViewList(this.title, this.description);
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 39, right: 39),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //label container
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "$title",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            // padding:EdgeInsets.only(left: 45),
            decoration: BoxDecoration(color: Color.fromRGBO(241, 238, 238, 1)),
            child: Text(
              "$description",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            padding: EdgeInsets.only(top: 17, bottom: 17, left: 13, right: 45),
          )
        ],
      ),
    );
  }
}
