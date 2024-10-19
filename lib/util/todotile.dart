import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  
  final String nomTache; 
  final bool tacheDone;
  Function(bool?)? onChanged;
  Todotile({super.key , required this.nomTache , required this.tacheDone , required this.onChanged});
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Checkbox(value: tacheDone, onChanged: onChanged ,activeColor: Colors.red, checkColor: Colors.white,),
            Text(nomTache),

           
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12)
          ),
        
      ),
    );
  }
}