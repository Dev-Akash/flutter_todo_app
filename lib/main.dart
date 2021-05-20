import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Todos> _todos = <Todos>[];
  TextEditingController _titleController = new TextEditingController(text: "");
  TextEditingController _descController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            setState(() {
              _todos.add(Todos("", ""));
            });
            // print(_todos.toString());
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFFB8BDEB), Color(0xFF890BAE)]),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/Images/Logo.png"),
                Expanded(
                  child: (_todos.length == 0)?
                      Center(
                        child: Text("Add Some Tasks",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                      :
                  ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        padding: EdgeInsets.all(20.0),
                        decoration: new BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (_todos.elementAt(index).getTitle() != "")
                                ? Text(
                                    _todos.elementAt(index).getTitle(),
                                    textAlign: TextAlign.start,
                                    style: new TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Task Title",),
                                    onSubmitted: (value) {
                                      setState(() {
                                        _titleController.text = "";
                                        _todos.elementAt(index).title = value;
                                      });
                                    },
                                    controller: _titleController,
                                  ),
                            (_todos.elementAt(index).getDesc() != "")
                                ? Text(
                                    _todos.elementAt(index).getDesc(),
                                    style: new TextStyle(
                                        fontSize: 18, height: 1.5),
                                  )
                                : Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Task Description",
                                      ),
                                      onSubmitted: (value) {
                                        setState(() {
                                          _descController.text = "";
                                          _todos.elementAt(index).desc = value;
                                        });
                                      },
                                      controller: _descController,
                                    ),
                                  ),
                            ((_todos.elementAt(index).getDesc() != "") &
                                    (_todos.elementAt(index).getTitle() != ""))
                                ? Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _titleController.text = _todos.elementAt(index).title;
                                              _descController.text = _todos.elementAt(index).desc;
                                              _todos.elementAt(index).title = "";
                                              _todos.elementAt(index).desc = "";
                                            });
                                            print("worked!!");
                                          },
                                          child: Icon(Icons.edit),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _todos.removeAt(index);
                                            });
                                          },
                                          child: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text(
                                        "Press Enter after Filling Values")),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Todos {
  String title;
  String desc;

  Todos(this.title, this.desc);

  getTitle() {
    return this.title;
  }

  getDesc() {
    return this.desc;
  }

  setTitle(String title){
    this.title = title;
  }

  setDesc(String desc){
    this.desc = desc;
  }

  @override
  String toString() {
    return "[" + title + "," + desc + "]";
  }
}
