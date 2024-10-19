import 'package:first_app_1/data/db.dart';
import 'package:first_app_1/util/alert_box.dart';
import 'package:first_app_1/util/todotile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Todo extends StatefulWidget {
  
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  //hive
final monBox = Hive.box("mon box");
ToDoDB db =  ToDoDB();

@override
  void initState() {
    // TODO: implement initState

    if (monBox.get("listtodo") == null) {
       db.createDataInitiale();
    } else {
      db.loadData(); 
    }
    super.initState();
  }

final _controlleur = TextEditingController();
  //list
  
  //method
  void checkBoxChanged(bool? value , int index) {
    setState(() {
      db.listeToDo[index][1] = !db.listeToDo[index][1];
    });
    db.updateDB();
    }

  void saveTache() {
    setState(() {
      db.listeToDo.add([_controlleur.text, false]);
      _controlleur.clear();
    });
    Navigator.of(context).pop();
    db.updateDB();
  }

    void creerTache() {
      showDialog(context: context, builder:  (context) {
        return DialogBox(
          controlleur : _controlleur,
          Enregistrer: saveTache,
          Retour: () => Navigator.of(context).pop(),
        ) ;
      },);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
       title: Center(
        child: Text("ToDo app" , style: TextStyle(color: Colors.white),),
        
       ),
       elevation: 700,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creerTache,
        child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.listeToDo.length,
        itemBuilder: (context, index) {
          return Todotile(nomTache: db.listeToDo[index][0], tacheDone: db.listeToDo[index][1], 
          onChanged: (value) => checkBoxChanged(value, index));
        },
      
      ),
      
    );
  }
}