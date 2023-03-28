import 'package:get/get.dart';

class CurdController extends GetxController{
  List<String> items = ["items_1","items_2","items_3"];

  void addItem (String newTodoItem){
    items.add(newTodoItem);
    update();
  }


  void removeItem(String item){
    items.remove(item);
    update();
  }
}