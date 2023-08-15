import 'package:flutter/material.dart';

class NavWidget extends StatelessWidget {
  NavWidget(this.nav_text);
  String? nav_text;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 12, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: Color.fromRGBO(238, 111, 87, 1)),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context).pushNamed("/");
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 14, top: 14),
            decoration: BoxDecoration(
                // border:Border.all(),

                color: Color.fromRGBO(255, 252, 252, 1)),
            child: Text(
              "$nav_text",
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Create Task"),
                    onTap: () {
                      Navigator.of(context).pushNamed('/create');
                    },
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Settings"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Exit"),
                  )
                ];
              },
            ),
          )
        ],
      ),
    );
  }
}
