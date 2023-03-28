import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'curd_controller.dart';


class TodoScreen extends StatelessWidget{

  final CurdController controller = Get.put(CurdController());

   TodoScreen({super.key});


  @override

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(title: const Text("Todo List"),),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(controller.items[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: (){
                    controller.removeItem(controller.items[index]);
                  },

                ),
              );
            },

          )),
          Padding(
              padding: const EdgeInsets.all(8.0),
    child: Form(
    child: TextFormField(
    decoration: const InputDecoration(
    labelText: "Add item",
    border: OutlineInputBorder(),
    ),
    onFieldSubmitted: (value) {
    controller.addItem(value);
    Get.back();
    },
    ),
 ),
          )
        ],

      ),


    );
  }
}

