import 'package:dio/dio.dart';
import 'package:todolist/Model/TaskModel.dart';

class Taskservices {

   static Dio dio=Dio();
   //get model
  static Future<Taskmodel> GetTodoListService()async{
  try{
   Response response =await dio.get("https://mytodoapi.runasp.net/api/TodoItems/");
     return Taskmodel.fromJson(response.data);

  }catch(e){
    throw Exception(e);
  }
  }
  //add void
  static Future<void> postTodoListService(String title)async{
  try{

   Response response =await dio.post("https://mytodoapi.runasp.net/api/TodoItems/",
   data: {
     "title":title,
     "isCompleted":false,
     "createdAt":"2026-11-24T09:19:49.8455995"

   });
     
  }catch(e){
    throw Exception(e);
  }
  }
   // put void
   static Future<void> putTodoListService(int id,String title)async{
  try{

   Response response =await dio.put("https://mytodoapi.runasp.net/api/TodoItems/$id",
   data: {
     "title":title
   });
     
  }catch(e){
    throw Exception(e);
  }
  }

static Future<void> deleteTodoListService(int id)async{
  try{

   Response response =await dio.delete("https://mytodoapi.runasp.net/api/TodoItems/$id");
  
     
  }catch(e){
    throw Exception(e);
  }
  }
}