import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo_list/presentation/widgets/navigator.dart';
import 'package:to_do_app/features/todo_list/presentation/widgets/veiw.dart';

class ViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "View details",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: NavWidget("Task Detail")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image Container
                  Container(
                    child: Image.asset("assets/view_lists.png"),
                  ),

                  Column(
                    children: [
                      ViewList("Title", "UI/UX App Design"),
                      ViewList("Description",
                          "First I have to animate the logo and prototyping my design. It\'s very important."),
                      ViewList("Deadline", "April. 29, 2023")
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
