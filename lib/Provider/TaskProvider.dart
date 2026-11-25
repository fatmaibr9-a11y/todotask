import 'package:flutter/foundation.dart';
import 'package:todolist/Model/TaskModel.dart';
import 'package:todolist/Services/TaskServices.dart';

class Taskprovider extends ChangeNotifier{


   int counter =0;
 Taskmodel? taskmodel;

 getTodoListProvider()async{

 taskmodel=await Taskservices.GetTodoListService();
 counter=taskmodel!.todoList.length;
  notifyListeners();
 }

postTodoProvider(String title)async{
  await Taskservices.postTodoListService( title);
  counter++;
 notifyListeners();
 getTodoListProvider();
}

 putTodoList(int id,String title)async{
 await Taskservices.putTodoListService(id, title);
 notifyListeners();
 getTodoListProvider();
 }


 deleteTodoList(int id)async{
 await Taskservices.deleteTodoListService(id);
 counter--;
 notifyListeners();
 }
}