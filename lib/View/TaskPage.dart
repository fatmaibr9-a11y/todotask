import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TaskProvider.dart';
import 'package:todolist/custom/CustomButtonSheet.dart';

class Taskpage extends StatelessWidget {
   Taskpage({super.key});
   TextEditingController addController = TextEditingController();
  TextEditingController UpdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Taskprovider taskprovider = Provider.of<Taskprovider>(listen: false,context);
    return Scaffold(
     body: Container(
      color: Colors.teal,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(Icons.checklist,color: Colors.white,size: 30,),
                Text("ToDayDo",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)),

              ],
            ),
            SizedBox(height: 6,),
            Text("${taskprovider.counter} Tasks",
            style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15,),
            Container(
              width: 1600,
              height: 542,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Consumer<Taskprovider>
              ( builder: (context, value, child) {
                
                if(value.taskmodel==null){
                  value.getTodoListProvider();
                  return Center(child: CircularProgressIndicator());
                }else{
                  return ListView.builder(
                    itemCount: value.taskmodel!.todoList.length,
                    itemBuilder: (context,index)=> Card(
                         elevation: 3,
                         color: Colors.white,
                         child: ListTile(
                          title: Text(value.taskmodel!.todoList[index]["title"]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(onPressed: (){
                                UpdateController.text=value.taskmodel!.todoList[index]["title"];
                                showModalBottomSheet(context: context, builder: (context)=>Custombuttonsheet
                                (buttonText: "Update", controller: UpdateController, onpressed: (){
                                  value.putTodoList(value.taskmodel!.todoList[index]["id"] as int ,UpdateController.text);
                                }, title: "Update Task"));
                              }, icon: Icon(Icons.edit)),
                              SizedBox(width: 3,),
                              IconButton(onPressed:(){
                                value.deleteTodoList(value.taskmodel!.todoList[index]["id"]as int);
                              } , icon: Icon(Icons.delete,color: CupertinoColors.systemRed,))
                            ],
                          ),
                         ),
                         
                    ),



                    
                  );
                }
              },
                
              ),
            ),
            
          ],
        ),
        ),

     ),

    );
  }
}