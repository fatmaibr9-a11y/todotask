import 'package:flutter/material.dart';

class Custombuttonsheet extends StatelessWidget {
   Custombuttonsheet({super.key,required this.buttonText,required this.controller,required this.onpressed,required this.title});

    final TextEditingController controller;
    final String title ;
    final String buttonText;
    final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: (){},
       builder: (_){
        return Container(
          height: 200,
          width: 500,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(title,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(height: 15,),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  label: Text(title),
                  border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                ),

              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){}, child: Text(buttonText,style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal,minimumSize: Size(double.infinity,45)),
              
              ),
            ],
          ),

        );
       }
      );
  }
}