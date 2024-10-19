import 'package:hive/hive.dart';

class ToDoDB {
  List listeToDo = [];
  final monBox = Hive.box("mon box");
  void createDataInitiale() {

    listeToDo = [
    ["go gym" , false],
    ["buy groceries", false],];
  
  }
  void loadData() {
   listeToDo = monBox.get("listtodo");
  }
  void updateDB () {
   monBox.put("listtodo", listeToDo);
  }
}
