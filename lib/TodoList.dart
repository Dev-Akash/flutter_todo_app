import 'Todo.dart';
import 'dart:convert';

class TodoList{
  List<Todos> list;

  TodoList(this.list);

  String toString(){
    String finalString = '[';
    for(int i = 0; i<list.length; i++){
      String card = json.encode(list.elementAt(i).toJson());
      finalString+=card+",";
    }
    finalString = finalString.substring(0, finalString.length-1);
    finalString+= "]";
    return finalString;
  }

  List<Todos> toList(String value){
    List<dynamic> asdf = json.decode(value);
    int length = asdf.length;
    List<Todos> list = <Todos>[];
    // print(Todos.fromJson(asdf[0]));
    for(int i=0; i<length; i++){
      list.add(Todos.fromJson(asdf[i]));
    }
    return list;
  }
}