class Taskmodel {

   List<dynamic> todoList;
  Taskmodel({required this.todoList});
  
  factory Taskmodel.fromJson(Map<String,dynamic> json){
    return Taskmodel(todoList: json["todoList"]);
  }
}