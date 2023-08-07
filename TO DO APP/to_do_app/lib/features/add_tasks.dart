import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/navigator.dart';

class CreateTodo extends StatefulWidget {
  CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  String? nav = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Create new todo",
        home: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: ListView(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          NavWidget(nav),
                          Container(
                            child: Center(
                              child: Text(
                                "Create new task",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Form(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            margin: EdgeInsets.only(bottom: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30, bottom: 8),
                                  child: Text(
                                    "Main task name",
                                    style: TextStyle(
                                        color: Color.fromRGBO(238, 111, 87, 1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 7,
                                            blurRadius: 5,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        // suffixIcon: Icon(Icons.calendar_month_outlined)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30, bottom: 8),
                                  child: Text(
                                    "Due Date",
                                    style: TextStyle(
                                        color: Color.fromRGBO(238, 111, 87, 1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 7,
                                            blurRadius: 5,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: TextFormField(
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          suffixIcon: Icon(
                                              Icons.calendar_month_outlined)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30, bottom: 8),
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                        color: Color.fromRGBO(238, 111, 87, 1),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 7,
                                            blurRadius: 5,
                                            offset: Offset(0, 3))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      cursorColor: Colors.black,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        // floatingLabelBehavior: FloatingLabelBehavior.always,
                                        // labelText: "Description"
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: FloatingActionButton.extended(
                        onPressed: null,
                        label: Text(
                          "Add task",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                          ),
                        ),
                        backgroundColor: Color.fromRGBO(238, 111, 87, 1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
