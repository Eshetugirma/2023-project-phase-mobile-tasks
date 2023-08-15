import 'package:flutter/material.dart';
import 'package:to_do_app/features/todo_list/presentation/pages/to_do_lists.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoList()));
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      // border: Border.all(
                      //   // color: Colors.black
                      // ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ],
                      color: Colors.white,
                    ),
                    width: 49,
                    height: 47,
                    child: Center(
                      child: Text(
                        "U",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    // height: 20,
                    child: Text(
                      "UI/UX App Design",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                  color: Colors.red,
                  width: 3,
                )),
              ),
              child: Text("Apr, 29, 2023"),
            )
          ],
        ),
      ),
    );
  }
}
