import 'package:flutter/material.dart';
import 'package:to_do_clean_archtecture/widgets/to_do_card.dart';
import 'package:to_do_clean_archtecture/widgets/navigator.dart';

class TodoList extends StatelessWidget {
  Widget build(BuildContext context) {
    List<Widget> lists = [];
    for (int i = 0; i < 10; ++i) {
      lists.add(TodoCard());
    }
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Todo List",
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavWidget("Todo-list"),
                  Center(child: Image.asset('assets/to_do_list.png')),
                  Container(
                    margin: EdgeInsets.only(left: 25, bottom: 8),
                    child: Text(
                      "Todo List",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    height: 300,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListView(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
                      children: lists,
                    ),
                  ),
                  Center(
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/create');
                          },
                          label: Text(
                            "Create task",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                            ),
                          ),
                          backgroundColor: Color.fromRGBO(238, 111, 87, 1),
                          extendedPadding: EdgeInsets.only(
                              left: 72, right: 72, top: 7, bottom: 7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
