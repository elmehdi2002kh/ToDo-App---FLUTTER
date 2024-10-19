import 'package:first_app_1/util/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controlleur;
  VoidCallback Enregistrer;
  VoidCallback Retour;
   DialogBox({super.key, required this.Enregistrer , required this.Retour,required this.controlleur});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(height: 200,
      child: Column(children:
       [TextField( 
        decoration: InputDecoration( hintText: "ajouter une tache"),
        controller: controlleur,
      ),
      Row(children: [
        MyButton(text: "Enregistrer", onPressed: Enregistrer) ,
        MyButton(text: "Retour", onPressed: Retour),
      ],)],
      
      
      
      ),

      ),
      
    );
  }
}